import 'package:flutter/material.dart';

class StoreWebPage extends StatelessWidget {
  final String? name;
  final String? description;

  StoreWebPage({this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //store profile pic
            Text("THIS IS TEMPLATE 2"),
            Text("Welcome to $name"),
            Text("$description"),
            Text("Here's our catalogue"),
          ],
        ),
      ),
    );
  }
}
