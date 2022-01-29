import 'package:flutter/material.dart';
import 'package:realtime_database/services/auth.dart';
import 'package:realtime_database/utils/route_data.dart';
import 'package:realtime_database/view/widgets/loading_file.dart';

class RegView extends StatefulWidget {
  const RegView({Key? key}) : super(key: key);
  // final Function toogleView;
  // RegView((this.toogleView));
  @override
  _RegViewState createState() => _RegViewState();
}

class _RegViewState extends State<RegView> {
  bool loading = false;
  String error ='';
  final AuthService _auth = AuthService();
  final _formKey2 = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return loading ? LoadNow():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        title: Text("Let Start : Register Now  "),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 50),
        child: ListView(
          children: [
            Form(
              key: _formKey2,
              child: Column(
              children: [
                SizedBox(height: 60,),
                TextFormField(
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Email  can not be null";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown)
                      ),
                      icon: Icon(Icons.email,color: Colors.brown,),
                      hintText: "Email", labelText: "Enter Email Address"),

                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                  validator: (val) {
                    if (val!.length < 6 ) {
                      return "Password  must be of more than 6 char";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown)
                      ),
                      icon: Icon(Icons.password_sharp,color: Colors.brown,),
                      hintText: "Password",
                      labelText: "Enter Password"),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown)),
                  onPressed: () async {
                    //reg on tap
                    if(_formKey2.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if (result==null){
                        setState(() {
                          loading = false;
                          error = "pls supply a vaild email";
                        });
                        print(error);
                      }
                     else{
                       setState(() {
                         loading = false;
                         error = "User created you are login IN  ";
                       });
                      }

                    }

                  }, child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,children: [
                  Text("Register",textScaleFactor: 1.4,),

                  Icon(Icons.app_registration,size: 40,color: Colors.white,)],),
                ),
                Center(child: Text(error),),
                SizedBox(height: 30,),
                TextButton.icon(onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
                  icon: Icon(Icons.login_sharp),
                  label: Text("Have account ? get Login Now"),)
              ],
            ),

            )
          ],
        ),
      )
    );
  }
}
