import 'package:online_groceries/model/type_model.dart';

import 'offer_product_model.dart';

class MainPageModel {
  List<OfferProductModel> offerArr;
  List<OfferProductModel> bestSellingArr;
  List<TypeModel> groceriesArr;
  List<OfferProductModel> listArr;

  MainPageModel(
      {this.offerArr = const [],
      this.bestSellingArr = const [],
      this.groceriesArr = const [],
      this.listArr = const []});
}
