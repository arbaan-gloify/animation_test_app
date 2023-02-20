import 'package:animation_test_app/animated_text/great_list_view.dart';
import 'package:animation_test_app/animation/animated_list.dart';
import 'package:animation_test_app/animation/list2.dart';
import 'package:animation_test_app/animation/list_screen.dart';
import 'package:animation_test_app/animation/rive.dart';
import 'package:animation_test_app/animation/tween_builder.dart';
import 'package:animation_test_app/routs/generated_routs.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:great_list_view/great_list_view.dart';

void main() {
  Executor().warmUp();
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routers.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ReorderableViewPage(),
    );
  }
}
