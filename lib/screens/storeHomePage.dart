import 'package:flutter/material.dart';

class StoreHomePage extends StatelessWidget {
  final String? name;
  final String? description;

  StoreHomePage({this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(name!), Text(description!)],
      ),
    );
  }
}
