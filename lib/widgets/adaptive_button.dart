// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final Function submit;
  final String title;
  final bool filled;
  const AdaptiveButton({
    super.key,
    required this.submit,
    required this.title,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? filled
            ? CupertinoButton.filled(
                onPressed: () {
                  submit(context);
                },
                child: Text(title),
              )
            : CupertinoButton(
                onPressed: () {
                  submit();
                },
                child: Text(title),
              )
        : filled
            ? ElevatedButton(
                onPressed: () {
                  submit(context);
                },
                child: Text(title),
              )
            : TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(title),
              );
  }
}
