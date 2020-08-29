import 'package:flutter/material.dart';
import 'package:gooey_carousel/gooey_carrousel.dart';

import '../screens/onBoardingScreens/screenOne.dart';
import '../screens/onBoardingScreens/screenTwo.dart';
import '../screens/onBoardingScreens/screenThree.dart';
import '../screens/onBoardingScreens/screenFour.dart';

class OnBoardingScreen extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: GooeyCarousel(
            children: <Widget>[
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
              ScreenFour(),
            ],
          ),
        ),
      ),
    );
  }
}
