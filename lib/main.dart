import 'package:animation_test_app/animation/animated_list.dart';
import 'package:animation_test_app/animation/coin.dart';
import 'package:animation_test_app/animation_screens/ainmation_crossfade.dart';
import 'package:animation_test_app/routs/generated_routs.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
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
      home:  const AnimatedCrossfades(),
    );
  }
}
