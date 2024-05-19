import 'package:online_groceries/domain/repositories/get_main_page_data_repository.dart';

import '../model/main_page_model.dart';

class GetMainPageDataUseCase {
  final IGetMainPageDataRepository _getMainPageDataRepository;

  GetMainPageDataUseCase(this._getMainPageDataRepository);

  Future<MainPageModel> execute() async {
    return await _getMainPageDataRepository.getMainPageData();
  }
}