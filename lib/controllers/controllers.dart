import 'package:e_market/classes/FirebaseService.dart';
import 'package:e_market/collections/collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CollectionLengthController extends GetxController {
  //controllers for tracking the lengths of collections
  var storeCollectionLength = FirebaseService.getStoreCollecitonLength().obs;
  var productCollectionLength = productCollection.length.obs;
  var categoryCollectionLength = categoryCollection.length.obs;

  //methods for listening to changes in the collection lengths and modifying the controllers accordingly

  //change length of the Store Collection
  void changeStoreCollectionLength() {
    storeCollectionLength.value = storeCollection.length;
    update();
  }

  //change the length of the product collection
  void changeProductCollectionLength() {
    productCollectionLength.value = productCollection.length;
    update();
  }

  //change the length of the category collection
  void changeCategoryCollectionLength() {
    categoryCollectionLength.value = categoryCollection.length;
    update();
  }
}

class SignedInStateController extends GetxController {
  RxBool signedIn = (FirebaseAuth.instance.currentUser != null).obs;

  void changeSignedInState() {
    signedIn.value = (FirebaseAuth.instance.currentUser != null);
    update();
  }
}
