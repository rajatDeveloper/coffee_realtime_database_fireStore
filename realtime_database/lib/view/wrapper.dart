
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_database/models/user.dart';
import 'package:realtime_database/view/authenticate/authenticate.dart';
import 'package:realtime_database/view/home/home_view.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);

    //return home or authview
    if(user == null ){
      return AuthView();
    }
    else{
      return HomeView();
    }
  }
}
