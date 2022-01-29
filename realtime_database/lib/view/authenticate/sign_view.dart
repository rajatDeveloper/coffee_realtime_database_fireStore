import 'package:flutter/material.dart';
import 'package:realtime_database/services/auth.dart';
import 'package:realtime_database/utils/route_data.dart';
import 'package:realtime_database/view/widgets/loading_file.dart';


class SignView extends StatefulWidget {
  const SignView({Key? key}) : super(key: key);

  @override
  _SignViewState createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {

  final AuthService _auth = AuthService();
  final _formKey1 = GlobalKey<FormState>();
  //text field
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ?LoadNow(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        title: Text("Welcome Back : Login "),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 50),
        child: Form(
          key: _formKey1,
          child: ListView(
          children: [
            SizedBox(height: 60,),
            TextFormField(
              onChanged: (val){
              setState(() {
                email = val;
              });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
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
                return "Password must be of more than 6 char";
              }
              return null;
            },
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown)
                  ),
                  icon: Icon(Icons.password_sharp,color: Colors.brown,),
                  hintText: "Password", labelText: "Enter Password"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.brown)),
              onPressed: () async {
                if(_formKey1.currentState!.validate()){
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if (result==null){
                    setState(() {
                      error = "error while sign In ...";
                      loading = false ;
                    });

                  }

                }

              }, child: Row(
              mainAxisAlignment:MainAxisAlignment.center,children: [
                Text("Login",textScaleFactor: 1.4,),
                Icon(Icons.login,size: 40,color: Colors.white,)],),
            ),
            Center(child: Text(error),),
            SizedBox(height: 30,),
            TextButton.icon(onPressed: (){
              Navigator.pushNamed(context, MyRoutes.regRoute);
            },

              icon: Icon(Icons.app_registration_sharp),
              label: Text("Not have account ? get it now "),)
          ],
        ),

        )
      ),
    );
  }
}
