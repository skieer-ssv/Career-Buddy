import 'package:agm/screens/animatedLoginScreen.dart';
import 'package:agm/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              22.0,
            ),
            child: Text(
              'User Profile',
              style: Theme.of(context).textTheme.subtitle,

            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 8.0,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Text('User Data'),
          ),
          Spacer(),
          RaisedButton(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 150.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(MyHomePage.route);
            },
            color: Theme.of(context).primaryColor,
            child: Text(
              'Logout',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ),
    );
  }
}
