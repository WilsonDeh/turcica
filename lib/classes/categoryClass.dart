import 'package:e_market/controllers/controllers.dart';
import 'package:get/get.dart';

class CategoryClass {
  List<CategoryClass>? collection;
  CategoryClass({this.collection});
  static RxInt collectionLengthController =
      CollectionLengthController().categoryCollectionLength;
}
