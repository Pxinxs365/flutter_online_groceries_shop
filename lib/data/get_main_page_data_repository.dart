import 'dart:async';

import 'package:online_groceries/common/service_call.dart';

import '../common/globs.dart';
import '../domain/repositories/get_main_page_data_repository.dart';
import '../model/main_page_model.dart';
import '../model/offer_product_model.dart';
import '../model/type_model.dart';

class GetMainPageDataRepository extends IGetMainPageDataRepository {
  @override
  Future<MainPageModel> getMainPageData() async {
    var mainPageModel = MainPageModel();

    final completer = Completer<MainPageModel>();

    ServiceCall.post({}, SVKey.svHome, isToken: true,
        withSuccess: (resObj) async {
      if (resObj[KKey.status] == "1") {
        var payload = resObj[KKey.payload] as Map? ?? {};

        var offerDataArr = (payload["offer_list"] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        mainPageModel.offerArr = offerDataArr;

        var bestSellingDataArr =
            (payload["best_sell_list"] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        mainPageModel.bestSellingArr = bestSellingDataArr;

        var typeDataArr = (payload["type_list"] as List? ?? []).map((oObj) {
          return TypeModel.fromJson(oObj);
        }).toList();

        mainPageModel.groceriesArr = typeDataArr;

        var listDataArr = (payload["list"] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        mainPageModel.listArr = listDataArr;

        completer.complete(mainPageModel);
      } else {
        // Handle non-success status if needed
        completer.completeError('Non-success status received');
      }
    }, failure: (err) async {
      // completer.completeError(Exception(err)); // TODO: Original response

      // TODO: Mocked data
      mainPageModel.offerArr = [
        OfferProductModel(offerPrice: 123, name: "My name", detail: "Details")
      ];
      completer.complete(mainPageModel);
    });

    return completer.future;
  }
}
