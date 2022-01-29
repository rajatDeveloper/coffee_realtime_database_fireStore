import 'package:flutter/material.dart';
import 'package:realtime_database/models/brew_model.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 2),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: AssetImage("assets/images/coffee_icon.png"),
          ),
          title: Text(brew.name),
          subtitle: Text("Takes : ${brew.sugars} sugar(s)"),
        ),
      ),
    );
  }
}

