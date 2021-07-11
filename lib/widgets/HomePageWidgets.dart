import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_market/classes/AuthenticationService.dart';
import 'package:e_market/classes/FirebaseService.dart';
import 'package:e_market/collections/collections.dart';
import 'package:e_market/controllers/controllers.dart';
import 'package:e_market/screens/signInScreen.dart';
import 'package:e_market/screens/signUpScreen.dart';
import 'package:e_market/widgets/displayRow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSamples extends StatelessWidget {
  HomeSamples({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CollectionLengthController controller;
  FirebaseFirestore db = FirebaseFirestore.instance;

  //final List<String>storeList = db.collection("StoreCollection").doc("products").collection("Food")

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //categories row
            // DisplayRow(
            //     displayName: "Categories",
            //     collectionLength: controller.categoryCollectionLength.value,
            //     collection: null),

            // //top products row
            // DisplayRow(
            //   displayName: "Top Products",
            //   collectionLength: controller.productCollectionLength.value,
            //   collection: null,
            //   //storeCollection
            // ),

            //top Stores row
            DisplayRow(
              collectionLength: controller.storeCollectionLength.value,
              collection: FirebaseService().getStoreCollection(),
              displayName: "Top Stores",
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final SignedInStateController authController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Turcica",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 40),
          ),
          // ElevatedButton(
          //   child: Text("check user"),
          //   onPressed: () {
          //     print(FirebaseAuth.instance.currentUser?.email);
          //   },
          // ),
          Spacer(
            flex: 10,
          ),
          GestureDetector(
            child: Text(
              "Join us",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            onTap: () => Get.to(SignUpPage()),
          ),
          Spacer(),
          Obx(
            () => GestureDetector(
              child: Text(
                (authController.signedIn.value) ? "Log Out" : "Log In",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),

              // (FirebaseAuth.instance.currentUser == null)
              //     ? Text("Log in")
              //     : Text("Log out"),
              onTap: () async {
                if (FirebaseAuth.instance.currentUser == null) {
                  Get.to(SignInPage());
                } else {
                  await AuthenticationService().signOut();
                  authController.changeSignedInState();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
