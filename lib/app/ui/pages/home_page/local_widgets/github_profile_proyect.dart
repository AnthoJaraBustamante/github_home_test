import 'package:flutter/material.dart';
import 'package:github_home_test/app/data/network/consts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GitHubProyect extends StatelessWidget {
  const GitHubProyect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          launchUrlString('https://github.com/${Const.user}/${Const.repo}'),
      child: Text(
        Const.repo,
        style: GoogleFonts.blinker(
            color: const Color(0xff58a6ff), fontWeight: FontWeight.bold),
      ),
    );
  }
}

class GitHubUser extends StatelessWidget {
  const GitHubUser({
    Key? key,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString('https://github.com/${Const.user}'),
      child: Text(
        Const.user,
        style: GoogleFonts.blinker(
          color: const Color(0xff58a6ff),
        ),
      ),
    );
  }
}