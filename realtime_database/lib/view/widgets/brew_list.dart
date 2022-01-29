import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_database/models/brew_model.dart';
import 'package:realtime_database/view/widgets/brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    // getting data from provider and firebase cloud store
    final brews = Provider.of<List<Brew>>(context);
    print("number of data : ${brews.length}");

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (
          BuildContext context, int index) {
          return BrewTile(brew : brews[index]);
        },

    );
  }}

