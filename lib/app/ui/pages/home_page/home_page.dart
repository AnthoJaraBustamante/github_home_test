import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_home_test/app/data/models/commits_model.dart';
import 'package:github_home_test/app/ui/pages/home_page/local_widgets/github_profile_proyect.dart';
import 'package:github_home_test/app/ui/pages/home_page/local_widgets/loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import './controllers/home_controller.dart';
import 'local_widgets/gif_refresher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomeController>(
        init: HomeController(),
        id: 'commits',
        builder: (_) {
          return _.loading
              ? const LoadingGit()
              : Column(
                  children: [
                    const SafeArea(child: SizedBox(height: 30)),
                    Wrap(
                      children: const [
                        Icon(Icons.book_outlined),
                        SizedBox(width: 10),
                        GitHubUser(),
                        Text(' / '),
                        GitHubProyect(),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Container(
                    //   color: Colors.red,
                    //   height: 80,
                    //   width: double.infinity,
                    //   child: const Center(
                    //     child: Text('Commits'),
                    //   ),
                    // ),
                    Expanded(
                      child: SmartRefresher(
                        header:   GifHeader1(),
                        // header: WaterDropHeader(),
                        controller: _.refreshController,
                            onRefresh: _.onRefresh,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: _.commits.length,
                          itemBuilder: (__, index) {
                            final Commits commit = _.commits[index];
                            return SlideInLeft(
                                delay: Duration(milliseconds: index * 50),
                                child: Column(
                                  children: [
                                    CustomedTile(commit: commit),
                                    const Divider(),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                );
        },
      )),
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
    return ListTile(
      title: SlideInDown(
        from: 5,
        child: Row(
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
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ZoomIn(
                delay: const Duration(milliseconds: 300),
                child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(
                    commit.author.avatarUrl,
                  ),
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
      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      horizontalTitleGap: 2,

      // isThreeLine: true,
      onTap: () => launchUrl(Uri.parse(commit.htmlUrl)),
    );
  }
}
