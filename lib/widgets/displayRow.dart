import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_market/widgets/Avatar.dart';
import 'package:get/get.dart';

class DisplayRow extends StatelessWidget {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final String? displayName; //name that is displayed above the row
  final List<dynamic>?
      collection; //the collection whose elements are displayed by the DisplayRow widget
  final int?
      collectionLength; //the number of elements in the collection whose elements are displayed by the DisplayRow widget

  //DisplayRow constructor
  DisplayRow({this.displayName, this.collection, this.collectionLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(displayName!),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: collectionLength,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Avatar(),
                onTap: () {
                  // if (collection!.isNotEmpty) {
                  //   Get.to(collection![index].webPage);
                  // }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
