import 'package:e_market/controllers/controllers.dart';
import 'package:e_market/screens/eMartHome.dart';
//import 'package:e_market/screens/signInScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationWrapper extends StatelessWidget {
  final SignedInStateController authController =
      Get.put(SignedInStateController());

  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;

    print((authController.signedIn.value == true)
        ? "user signed In"
        : "user is signed out");
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Container(
          color: Colors.blue,
        );
      } else {
        return HomeDesktop();
      }
    });
  }
}
