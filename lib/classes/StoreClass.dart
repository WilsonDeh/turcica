import 'package:e_market/classes/product.dart';

import 'package:e_market/screens/StoreTemplates/template1.dart';

class StoreClass {
  //CollectionLengthController controller = Get.put(CollectionLengthController());

  List<ProductClass>? catalogue;
  String? logo;
  String? name;
  String? description;
  StoreWebPage? webPage;
  List<StoreClass>? collection;

  StoreClass(
      {this.name, this.description, this.logo, this.webPage, this.collection});
}
