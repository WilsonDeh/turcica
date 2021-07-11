//import 'package:e_market/collections/collections.dart';
//import 'package:e_market/classes/product.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_market/classes/FirebaseService.dart';
import 'package:e_market/controllers/controllers.dart';

import 'package:e_market/widgets/HomePageWidgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

class HomeDesktop extends StatelessWidget {
  final CollectionLengthController controller =
      Get.put(CollectionLengthController());

  final SignedInStateController authController =
      Get.put(SignedInStateController());

  @override
  Widget build(BuildContext context) {
    // final double pageHeight = MediaQuery.of(context).size.height;
    // final double pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.purple[400],
          //expandedHeight: 200,
          floating: true,
          pinned: true,

          flexibleSpace:
              Center(child: HomePageAppBar(authController: authController)),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            //height: 30,
            color: Colors.purple[300],
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 20, right: 20),
              child: Row(
                children: [
                  Spacer(),
                  Text("Your online store is only a few clicks away",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Spacer(),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      //height: MediaQuery.of(context).size.height,
                      child: GestureDetector(
                        child: Image.asset("images/photo1.jpg"),
                        onTap: () {
                          print("hi");
                          // FirebaseFirestore db = FirebaseFirestore.instance;
                          // Map<String, dynamic>? info;
                          // db
                          //     .collection("StoreCollection")
                          //     .doc("0b3akZYSPiVS8LiqjMqjh2cdFer1")
                          //     .get()
                          //     .then((snapshot) => info = snapshot.data());
                          // print(info);
                        },
                      )),
                  Spacer(),
                ],
              ),
            ),
          ),
          HomeSamples(controller: controller),
          Container(
            color: Colors.yellow[200],
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 20, right: 20),
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          "https://media.istockphoto.com/photos/shopping-online-concept-parcel-or-paper-cartons-with-a-shopping-cart-picture-id1249219777?b=1&k=6&m=1249219777&s=170667a&w=0&h=OuZETqlTDsobdd5XkTGIcqS7UHGAeMIpo04txLQLz6Y=",
                        )),
                  ),
                  Spacer(),
                  Text("Some Text"),
                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            color: Colors.orange,
          ),
          Container(
            height: 30,
            color: Colors.yellow,
          ),
          Container(
            height: 30,
            color: Colors.green,
          ),
          Container(
            height: 30,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            color: Colors.indigo,
          ),
          Container(
            height: 30,
            color: Colors.purple,
          ),
        ]))
      ],
    ));
  }
}

class HomeMobile extends StatelessWidget {
  final CollectionLengthController controller =
      Get.put(CollectionLengthController());

  final SignedInStateController authController =
      Get.put(SignedInStateController());

  @override
  Widget build(BuildContext context) {
    // final double pageHeight = MediaQuery.of(context).size.height;
    // final double pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.purple[400],
          //expandedHeight: 200,
          floating: true,
          pinned: true,

          flexibleSpace:
              Center(child: HomePageAppBar(authController: authController)),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            //height: 30,
            color: Colors.purple[300],
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      //height: MediaQuery.of(context).size.height,
                      child: Image.asset("images/photo1.jpg")),
                  Spacer(),
                  Text("Your online store is just a few clicks away",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Spacer(),
                ],
              ),
            ),
          ),
          HomeSamples(controller: controller),
          Container(
            color: Colors.yellow[200],
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          "https://media.istockphoto.com/photos/shopping-online-concept-parcel-or-paper-cartons-with-a-shopping-cart-picture-id1249219777?b=1&k=6&m=1249219777&s=170667a&w=0&h=OuZETqlTDsobdd5XkTGIcqS7UHGAeMIpo04txLQLz6Y=",
                        )),
                  ),
                  Spacer(),
                  Text("Some Text"),
                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            color: Colors.orange,
          ),
          Container(
            height: 30,
            color: Colors.yellow,
          ),
          Container(
            height: 30,
            color: Colors.green,
          ),
          Container(
            height: 30,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            color: Colors.indigo,
          ),
          Container(
            height: 30,
            color: Colors.purple,
          ),
        ]))
      ],
    ));
  }
}
