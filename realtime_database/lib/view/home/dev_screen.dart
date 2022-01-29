
import 'package:flutter/material.dart';

class DevView extends StatelessWidget {
  const DevView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Developer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            color: Colors.brown[100],
            child: Column(
              children: [
                SizedBox(height: 30,),
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/rd.jpg'),
                    radius: 80,

                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text("Rajat Dhiman",textScaleFactor: 1.9,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
