import 'package:flutter/material.dart';

class LoadNow extends StatelessWidget {
  const LoadNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.brown[800],
        ),
      ),
    );
  }
}
