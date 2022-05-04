import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoadingGit extends StatelessWidget {
  const LoadingGit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Expanded(
          child: ZoomIn(child: Image.asset('assets/mona-loading-dark.gif')),
        ),
        Container(
          width: double.infinity,
        ),
        const Spacer(),
      ],
    );
  }
} 