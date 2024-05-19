import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:online_groceries/common/globs.dart';

import '../domain/get_main_page_data_use_case.dart';
import '../model/main_page_model.dart';

class HomeViewModel extends GetxController {
  final GetMainPageDataUseCase _getMainPageDataUseCase;

  HomeViewModel(this._getMainPageDataUseCase);

  final Rx<MainPageModel> mainPageData = MainPageModel().obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (kDebugMode) {
      print("HomeViewModel Init ");
    }

    serviceCallHome();
  }

  //ServiceCall
  void serviceCallHome() async {
    Globs.showHUD();
    try {
      mainPageData.value = await _getMainPageDataUseCase.execute();
    } catch (err) {
      Get.snackbar(Globs.appName, err.toString());
    } finally {
      Globs.hideHUD();
    }
  }
}
