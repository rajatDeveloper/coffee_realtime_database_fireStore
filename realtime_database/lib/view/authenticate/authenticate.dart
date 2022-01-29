import 'package:flutter/material.dart';
import 'package:realtime_database/view/authenticate/reg_view.dart';
import 'package:realtime_database/view/authenticate/sign_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignView();
    }
    else{
      return RegView();
    }
  }
}
