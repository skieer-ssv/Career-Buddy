import 'package:flutter/material.dart';

import '../screens/loginScreen.dart';

//TODO, registeration logic remaining
class RegisterScreen extends StatelessWidget {
  static const route = 'register-screen';
  final GlobalKey<FormState> _formKey = GlobalKey();

  final emailidController = TextEditingController();

  final passwordController = TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: mediaQuery.size.width,
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 42.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ),
              Image.asset(
                'assets/images/registerscreen.png',
                height: mediaQuery.size.height * 0.4,
                width: mediaQuery.size.width,
              ),
              //email id
              Row(
                children: <Widget>[
                  Icon(Icons.email),
                  SizedBox(
                    width: 22.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Id',
                        labelStyle: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //password
              Row(
                children: <Widget>[
                  Icon(Icons.lock),
                  SizedBox(
                    width: 22.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //confirm password
              Row(
                children: <Widget>[
                  Icon(Icons.lock),
                  SizedBox(
                    width: 22.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 120.0,
                  vertical: 20.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: Text(
                  'Register',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              SizedBox(
                height: 120.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Already have an account?'),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.route);
                    },
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Colors.purple,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
