import 'package:animation_test_app/BLOC/screens/user_data_screen.dart';
import 'package:animation_test_app/animated_text/AnimatedPositionedList.dart';
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
      home: const UserdataScreen(),
    );
  }
}
