import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget LoadingCricle() {
  return Center(
    child: SizedBox(
      height: 30,
      width: 20,
      child: CupertinoActivityIndicator(),
    ),
  );
}