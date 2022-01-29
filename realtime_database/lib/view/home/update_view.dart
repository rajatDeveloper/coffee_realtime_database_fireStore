

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_database/models/user.dart';
import 'package:realtime_database/services/database_file.dart';
import 'package:realtime_database/view/widgets/loading_file.dart';


class UpadteForm extends StatefulWidget {
  const UpadteForm({Key? key}) : super(key: key);

  @override
  _UpadteFormState createState() => _UpadteFormState();
}

class _UpadteFormState extends State<UpadteForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4','5'];

  late String _currentName ;
  late String _currentSugars;
  int _currentStrength = 100;

  @override

  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid ).userData,
      builder: (context, snapshot) {
        // print(snapshot.hasData);
        if(snapshot.hasData){
          UserData? userData = snapshot.data;
          return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Update Your Data.",
                    textScaleFactor: 1.6,
                    style: TextStyle(color: Colors.brown[800]),),
                  Divider(color: Colors.brown,thickness: 10,),
                  SizedBox(height: 26,),
                  TextFormField(
                    initialValue: userData?.name,
                      decoration:InputDecoration(
                          label: Text("Name"),
                          hintText:'Enter your name',
                          icon: Icon(Icons.person,color: Colors.brown[600],size: 30,)
                      ) ,
                      validator: (val)=> val!.isEmpty ? 'Please Enter a name' : null ,
                      onChanged:(val)=> setState(() {
                        _currentName = val;
                      })
                  ),
                  SizedBox(height: 20,),
                  //dropdown for suger
                  DropdownButtonFormField(
                      value:   userData?.sugars,
                      icon: Icon(Icons.code),
                      hint: Text("Select numbers of sugars"),
                      items: sugars.map( (sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugar(s)'),
                        );
                      }).toList(), onChanged: (val){
                    setState(() {
                      _currentSugars = val.toString();
                    });
                  }),
                  SizedBox(height: 20,),
                  Text(
                    "Update Strength of Coffie : ",
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Colors.brown[800]),),
                  Slider(
                    activeColor: Colors.brown[_currentStrength ],
                    inactiveColor: Colors.brown[_currentStrength],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val){
                      setState(() {
                        _currentStrength =  val.round();
                      });
                    },
                    value:(_currentStrength).toDouble(),
                  ),

                  //slider for strength
                  SizedBox(height: 30,),
                  TextButton.icon(

                      onPressed: () async{
                        if(_formKey.currentState!.validate()){
                          await DatabaseService(uid: user.uid ).updateUserData(
                              _currentSugars ,
                              _currentName,
                              _currentStrength);
                          Navigator.pop(context);
                        }

                      },

                      icon: Icon(Icons.system_update_rounded,color: Colors.white,),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.brown)
                      ),
                      label: Text("Update",
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.4,))

                ],
              ));
        }else{
          return LoadNow();
        }
      }
    );
  }
}
