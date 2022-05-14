import 'package:flutter/material.dart';
import 'hi_there.dart';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ako',
      debugShowCheckedModeBanner: false,
      home: hi_there()
    );
  }
}

