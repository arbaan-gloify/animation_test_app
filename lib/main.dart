import 'package:animation_test_app/animation_screens/ainmation_crossfade.dart';
import 'package:animation_test_app/animation_screens/animated_align.dart';
import 'package:animation_test_app/animation_screens/animated_builder.dart';
import 'package:animation_test_app/animation_screens/animated_icon.dart';
import 'package:animation_test_app/animation_screens/animated_list.dart';
import 'package:animation_test_app/animation_screens/animated_physical_model.dart';
import 'package:animation_test_app/animation_screens/animation_rotation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationAlign(),
    );
  }
}
