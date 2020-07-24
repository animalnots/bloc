import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/user_repository.dart';
import 'package:flutter_firebase_login/login/login.dart';
import 'package:flutter_firebase_login/register/register.dart';

class WelcomeScreen extends StatelessWidget {
  final UserRepository _userRepository;

  WelcomeScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Column(
        children: <Widget>[
          Container(
            child: getRegistrationButton(context, _userRepository),
          ),
          Container(
            child: BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(userRepository: _userRepository),
              child: Builder(
                  builder: (context) =>
                      getLoginButton(context, _userRepository)),
            ),
            //child: getLoginButton(context, _userRepository),
          ),
        ],
      ),
    );
  }

  RaisedButton getRegistrationButton(
      BuildContext context, UserRepository userRepository) {
    return RaisedButton(
      child: Container(
        //padding: const EdgeInsets.only(top: 15.0),
        alignment: Alignment.center,
        width: 235,
        child: Text(
          "Register",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => RegisterScreen(
                    userRepository: userRepository,
                  )),
        );
      },
    );
  }

  FlatButton getLoginButton(
      BuildContext context, UserRepository userRepository) {
    return FlatButton(
      child: Container(
        //padding: const EdgeInsets.only(top: 15.0),
        alignment: Alignment.center,
        width: 235,
        child: Text(
          "Login",
          style: TextStyle(
              fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    userRepository: userRepository,
                  )),
        );

        //        Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) {
        //     return LoginScreen(userRepository: _userRepository);
        //   }),
        // );
      },
    );
  }
}
