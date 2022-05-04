// import 'package:animate_do/animate_do.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:github_home_test/app/data/models/commits_model.dart';
import 'package:github_home_test/app/ui/pages/home_page/local_widgets/github_profile_proyect.dart';
import 'package:github_home_test/app/ui/pages/home_page/local_widgets/loading_widget.dart';
import 'package:github_home_test/app/ui/theme/color_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import './controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        id: 'commits',
        builder: (_) {
          if (_.loading) {
            return const LoadingGit();
          } else {
            return _.commits.isEmpty
                ? Center(child: ZoomIn(child: const Text('No commits found')))
                : Column(
                    children: [
                      const SafeArea(child: SizedBox(height: 30)),
                      Wrap(
                        children: const [
                          Icon(
                            Icons.book_outlined,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          GitHubUser(),
                          Text(' / '),
                          GitHubProyect(),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                        child: SmartRefresher(
                          controller: _.refreshController,
                          onRefresh: _.onRefresh,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: _.commits.length,
                            itemBuilder: (__, index) {
                              final Commits commit = _.commits[index];

                              return CustomedTile(commit: commit);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
          }
        },
      ),
    );
  }
}

class CustomedTile extends StatelessWidget {
  const CustomedTile({
    Key? key,
    required this.commit,
  }) : super(key: key);

  final Commits commit;

  @override
  Widget build(BuildContext context) {
    List<String> splitMessage = commit.commit.splitMessage;
    if (splitMessage.length > 1) {
      splitMessage.first += '...';
    }
    bool onRegion = false;
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              splitMessage.first,
              style: GoogleFonts.blinker(
                // c9d1d9
                color: const Color(0xffc9d1d9),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(
                  commit.author.avatarUrl,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  commit.commit.author.name,
                  style: GoogleFonts.blinker(
                    color: const Color(0xffc9d1d9),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              GetBuilder<HomeController>(
                id: 'verified',
                init: HomeController(),
                builder: (_) {
                  return Visibility(
                    visible: commit.commit.verification.verified,
                    child: MouseRegion(
                      onEnter: (__) {
                        onRegion = true;
                        _.update(['verified']);
                      },
                      onExit: (__) {
                        onRegion = false;
                        _.update(['verified']);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: onRegion
                                ? ColorTheme.secondary
                                : ColorTheme.primary.withOpacity(0.5),
                            // width: 0.7,
                          ),
                        ),
                        child: Text(
                          'Verified',
                          style: GoogleFonts.blinker(
                            color: ColorTheme.secondary,
                            // fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 15),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorTheme.primary.withOpacity(0.5),
                      // width: 0.7,
                    ),
                  ),
                  child: Row(
                    children: [
                      GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (_) => GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: commit.sha));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Full SHA copied to clipboard"),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: ColorTheme.primary.withOpacity(0.5),
                                ),
                              ),
                            ),
                            child: const Icon(Icons.copy_outlined, size: 15),
                          ),
                        ),
                      ),
                      GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (_) => GestureDetector(
                          onTap: () => launchUrl(Uri.parse(commit.htmlUrl)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              commit.sha.substring(0, 7),
                              style: GoogleFonts.blinker(
                                color: const Color(0xff58a6ff),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(commit.treeUrl));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric( 
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorTheme.primary.withOpacity(0.5),
                        // width: 0.7,
                      ),
                    ),
                    child: const Icon(Icons.code, size: 15),
                  ),
                ),
              ),
            ],
          ),
          Text(
            commit.commit.author.commitedAt,
            style: GoogleFonts.blinker(
              color: const Color(0xff8b949e),
              // fontWeight: FontWeight.w2300,
              fontSize: 11,
            ),
          ),
        ],
      ),
      dense: true,
      leading: const Icon(Icons.commit_outlined),
      // trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      horizontalTitleGap: 2,

      // isThreeLine: true,
    );
  }
}
