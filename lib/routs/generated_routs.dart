import 'package:animation_test_app/Speech/my_speech.dart';
import 'package:animation_test_app/animated_text/animated_text.dart';
import 'package:animation_test_app/animation/home_screen.dart';
import 'package:animation_test_app/animation_screens/ainmation_crossfade.dart';
import 'package:animation_test_app/animation_screens/animated_align.dart';
import 'package:animation_test_app/animation_screens/animated_builder.dart';
import 'package:animation_test_app/animation_screens/animated_container.dart';
import 'package:animation_test_app/animation_screens/animated_icon.dart';
import 'package:animation_test_app/animation_screens/animated_list.dart';
import 'package:animation_test_app/animation_screens/animated_physical_model.dart';
import 'package:animation_test_app/animation_screens/animation_rotation.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    const String animatedCrossfades = '/AnimatedCrossfades';
    const String animationAlign = '/AnimationAlign';
    const String animatedBuilders = '/AnimatedBuilders';
    const String animatedContainers = '/AnimatedContainers';
    const String animatedIconss = '/AnimatedIconss';
    const String animatedListss = '/AnimatedListss';
    const String animatedPhusicalModelss = '/AnimatedPhusicalModelss';
    const String animationRotationss = '/AnimationRotationss';
    const String homePage = '/HomePage';
    const String mySpeech = '/MySpeech';

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AllInOne());
      case animatedCrossfades:
        return MaterialPageRoute(builder: (_) => const AnimatedCrossfades());
      case animationAlign:
        return MaterialPageRoute(builder: (_) => const AnimationAlign());
      case animatedBuilders:
        return MaterialPageRoute(builder: (_) => const AnimatedBuilders());
      case animatedContainers:
        return MaterialPageRoute(builder: (_) => const AnimatedContainers());
      case animatedIconss:
        return MaterialPageRoute(builder: (_) => const AnimatedIconss());
      case animatedListss:
        return MaterialPageRoute(builder: (_) => const AnimatedListss());
      case animatedPhusicalModelss:
        return MaterialPageRoute(
            builder: (_) => const AnimatedPhusicalModelss());
      case animationRotationss:
        return MaterialPageRoute(builder: (_) => const AnimationRotationss());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case mySpeech:
        return MaterialPageRoute(builder: (_) => const MySpeech());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
