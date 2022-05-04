import 'package:flutter/material.dart';

buildLoadingWidget() {
  return [
    const Spacer(),
    Expanded(
      child: Image.asset('assets/mona-loading-dark.gif'),
    ),
    Container(
      width: double.infinity,
    ),
    const Spacer(),
  ];
}
