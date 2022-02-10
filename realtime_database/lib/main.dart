import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database/models/user.dart';
import 'package:realtime_database/services/auth.dart';
import 'package:realtime_database/utils/route_data.dart';
import 'package:realtime_database/view/authenticate/authenticate.dart';
import 'package:realtime_database/view/authenticate/reg_view.dart';
import 'package:realtime_database/view/authenticate/sign_view.dart';
import 'package:realtime_database/view/home/dev_screen.dart';
import 'package:realtime_database/view/home/home_view.dart';
import 'package:realtime_database/view/wrapper.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData:null,
      child: MaterialApp(
        title: 'Rd Software',
        debugShowCheckedModeBanner: false,
        routes: {
          MyRoutes.homeRoute : (context)=>HomeView(),
          MyRoutes.authRoute : (context)=> AuthView(),
          MyRoutes.loginRoute: (context) =>SignView(),
          MyRoutes.regRoute : (context) =>RegView(),
          MyRoutes.devRoute : (context) => DevView(),
        },
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home:Wrapper(),
      ),
    );
  }
}


// 24  to start