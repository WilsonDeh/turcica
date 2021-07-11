import 'package:e_market/classes/AuthenticationService.dart';
import 'package:e_market/controllers/controllers.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
  final SignedInStateController authController =
      Get.put(SignedInStateController());

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(labelText: "Enter Email"),
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(labelText: "Enter Password"),
            ),
            ElevatedButton(
                child: Text("Finished"),
                onPressed: () async {
                  try {
                    await AuthenticationService()
                        .signIn(email.text, password.text);
                    authController.changeSignedInState();
                    print(FirebaseAuth.instance.currentUser!.uid);
                    Get.back();
                  } catch (e) {
                    print('couldnt sign in');
                  }
                })
          ],
        ),
      ),
    );
  }
}
