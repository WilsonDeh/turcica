import 'package:e_market/controllers/controllers.dart';
import 'package:get/get.dart';

class ProductClass {
  String? itemPhoto;
  String? itemName;
  String? itemDescription;
  double? itemPrice;
  List<ProductClass>? collection;

  ProductClass(
      {this.itemPhoto,
      this.itemName,
      this.itemDescription,
      this.itemPrice,
      this.collection});

  RxInt collectionLengthController() =>
      CollectionLengthController().productCollectionLength;
}
