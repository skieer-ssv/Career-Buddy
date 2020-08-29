import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/media_query.dart';
import '../screens/registerScreen.dart';
import '../screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final emailidController = TextEditingController();

  final passwordController = TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });
    //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    var form = _formKey.currentState;
    form.save();
    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _authData['email'],
      password: _authData['password'],
    )).user;
    //print("signed in " + user.displayName);
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Career Buddy',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 42.0,
        ),
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                Image.asset(
                  'assets/images/loginscreen.png',
                  height: mediaQuery.size.height * 0.4,
                  width: mediaQuery.size.width,
                ),
                SizedBox(
                  height: 20.0,
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
                        controller: emailidController,
                        style: Theme.of(context).textTheme.body2,
                        decoration: InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: Theme.of(context).textTheme.body1,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['email'] = value;
                        },
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
                    Icon(
                      Icons.lock,
                    ),
                    SizedBox(
                      width: 22.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        style: Theme.of(context).textTheme.body2,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.body1,
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 5) {
                            return 'Password is too short!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _authData['password'] = value;
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password ?',
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Colors.purple,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: login,
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Text(
                          'Login',
                          style: Theme.of(context).textTheme.button,
                        ),
                ),
                SizedBox(
                  height: 200.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account?'),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterScreen.route);
                        },
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.body1.copyWith(
                                color: Colors.purple,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
