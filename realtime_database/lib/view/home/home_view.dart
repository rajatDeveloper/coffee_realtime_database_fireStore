
import 'package:flutter/material.dart';
import 'package:realtime_database/models/brew_model.dart';
import 'package:realtime_database/services/auth.dart';
import 'package:realtime_database/view/home/update_view.dart';
import 'package:realtime_database/view/widgets/brew_list.dart';
import 'package:realtime_database/view/widgets/my_drawe.dart';
import 'package:provider/provider.dart';
import 'package:realtime_database/services/database_file.dart';


class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // const HomeView({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showPannel(){
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            padding: EdgeInsets.all(15),
            height: 400,
            child: UpadteForm(),
          );
        });
    }

    return StreamProvider<List<Brew>>.value(

      value: DatabaseService().brews,
      initialData:[],
      child: Scaffold(
        // backgroundColor: ,
        appBar: AppBar(
          actions: [
            // TextButton.icon(onPressed: () async{
            // await _auth.signOut();
            // }, icon: Icon(Icons.logout,color: Colors.white,),
            //     label: Text("Logout",style: TextStyle(
            //       color: Colors.white
            //     ),))
            TextButton.icon(onPressed: () => _showPannel()
                , icon: Icon(Icons.system_update,color: Colors.white,),
                label: Text("Upadte",style: TextStyle(
                  color: Colors.white
                ),))
          ],
          backgroundColor: Colors.brown[400],
          title: Text("Coffee Data")
        ),
        drawer:MyDrawer(),
        body:Container(
          decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/coffee_bg.png"),
              fit: BoxFit.cover
            )
          ),
            child: BrewList()),
      ),
    );
  }
}
