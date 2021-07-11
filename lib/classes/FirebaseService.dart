import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  //trial
  static Map<String, dynamic>? getInfo() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    Map<String, dynamic>? info;
    db
        .collection("StoreCollection")
        .doc("0b3akZYSPiVS8LiqjMqjh2cdFer1")
        .get()
        .then((snapshot) => info = snapshot.data());
    return info;
  }

  //getting store collection length
  static int? getStoreCollecitonLength() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    int? length;
    var docRef = db
        .collection("StoreCollection")
        .doc("products")
        .collection("food")
        .get();

    docRef.then((snapshot) => length = snapshot.size);
    return length;
  }

//getting store collection
  List<dynamic>? getStoreCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<dynamic>? collection;
    var docRef = db
        .collection("StoreCollection")
        .doc("products")
        .collection("food")
        .get();

    docRef.then((snapshot) => collection = snapshot.docs).catchError((error) {
      print(error);
    });
    return collection;
  }
}
