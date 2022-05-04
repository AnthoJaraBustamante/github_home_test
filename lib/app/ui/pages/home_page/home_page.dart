import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_home_test/app/data/models/commits_model.dart';
import 'package:github_home_test/app/ui/pages/home_page/local_widgets/loading_widget.dart';

import './controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
          child: GetBuilder<HomeController>(
        init: HomeController(),
        id:'commits',
        builder: (_) {
          return Column(
            children: [
              if (_.loading) ...buildLoadingWidget(),
              if (!_.loading)
                Expanded(
                  child: ListView.builder(
                    itemCount: _.commits.length,
                    itemBuilder: (__, index) {
                      final Commits commit = _.commits[index];
                      return ListTile(
                        title: Text(commit.commit.message),
                        subtitle: Text(commit.commit.author.name),
                        trailing:
                            Text(commit.commit.author.date.toIso8601String()),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      )),
    );
  }
}
