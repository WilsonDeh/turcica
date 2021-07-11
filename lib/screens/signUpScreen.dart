import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_market/classes/AuthenticationService.dart';
import 'package:e_market/classes/StoreClass.dart';
import 'package:e_market/collections/collections.dart';
import 'package:e_market/controllers/controllers.dart';

import 'package:e_market/screens/StoreTemplates/template1.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionLengthController storeLengthController =
      Get.put(CollectionLengthController());
  final SignedInStateController authController =
      Get.put(SignedInStateController());
  //final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController storeName = TextEditingController();
  final TextEditingController storeDescription = TextEditingController();
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
            TextFormField(
              controller: storeName,
              decoration: InputDecoration(labelText: "Enter Store Name"),
            ),
            TextFormField(
              controller: storeDescription,
              decoration: InputDecoration(labelText: "Enter Store Description"),
            ),

            //CheckboxListTile(value: false, onChanged: (value) {}),

            ElevatedButton(
                child: Text("Finished"),
                onPressed: () async {
                  await AuthenticationService()
                      .signUp(email.text, password.text);
                  authController.changeSignedInState();

                  //adding user to the user collection
                  await db
                      .collection("UserCollection")
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .set({
                    "email": email.text,
                    "password": password.text,
                    "preferredStoreTemplate": 2,
                  });

                  //adding user's store to the store collection

                  await db
                      .collection("StoreCollection")
                      .doc("products")
                      .collection("food")
                      .add({"id": FirebaseAuth.instance.currentUser?.uid});

                  // await db
                  //     .collection("StoreCollection")
                  //     .doc(FirebaseAuth.instance.currentUser?.uid)
                  //     .set({
                  //   "StoreName": storeName.text,
                  //   "StoreDescription": storeDescription.text,

                  // });

                  // await db.collection("StoreCollection").doc("storeCount").set({
                  //   "StoreCount": 2,
                  // });

                  StoreClass x = StoreClass(
                      webPage: StoreWebPage(
                          name: storeName.text,
                          description: storeDescription.text),
                      name: storeName.text,
                      description: storeDescription.text);
                  storeCollection.add(x);

                  //update the store collection length controller
                  storeLengthController.changeStoreCollectionLength();

                  Get.back();

                  // Get.to(
                  //     StoreAdminHome(name: x.name, description: x.description));
                })
          ],
        ),
      ),
    );
  }
}
