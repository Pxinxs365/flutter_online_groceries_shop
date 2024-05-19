import '../../model/main_page_model.dart';

abstract class IGetMainPageDataRepository {
  Future<MainPageModel> getMainPageData();
}
