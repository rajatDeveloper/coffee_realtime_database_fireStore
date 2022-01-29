import 'package:flutter/material.dart';
import 'package:realtime_database/services/auth.dart';
import 'package:realtime_database/utils/route_data.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(5),
                child: Card(

                  child: Container(

                    color: Colors.brown[900],
                    child: Center(child: Text("Brew Data",style: TextStyle(color: Colors.white),textScaleFactor: 1.8,)),
                  ),
                )),

            InkWell(
            onTap: () async{
    await _auth.signOut();
    },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.brown,
                  size: 30,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.brown,
                  ),
                  textScaleFactor: 1.3,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                  Navigator.pushNamed(context, MyRoutes.devRoute);
              },
              child: ListTile(
                leading: Icon(
                  Icons.code,
                  color: Colors.brown,
                  size: 30,
                ),
                title: Text(
                  "Developer",
                  style: TextStyle(
                    color: Colors.brown,
                  ),
                  textScaleFactor: 1.3,
                ),
              ),
            ),

          ],
        )

    );
  }
}
