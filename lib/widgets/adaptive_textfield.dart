// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType keyType;
  const AdaptiveTextfield({
    Key? key,
    required this.controller,
    required this.title,
    required this.keyType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            padding: EdgeInsets.all(10),
            controller: controller,
            placeholder: title,
            keyboardType: keyType,
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: title,
            ),
            keyboardType: keyType,
          );
  }
}
