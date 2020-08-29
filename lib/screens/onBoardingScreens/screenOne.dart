import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(22.0),
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Image.asset(
            'assets/images/onBoardingScreen/screen1.png',
            height: mediaQuery.size.height * 0.4,
            width: mediaQuery.size.width,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'We simplify information for you on various career options',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle.copyWith(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
          ),
          Spacer(),
          SizedBox(
            width: mediaQuery.size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
