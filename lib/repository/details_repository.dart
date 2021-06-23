import 'package:blog/utility/api_provider.dart';
import 'package:blog/utility/locator.dart';

class DetailsRepository{
  ApiProvider _apiProvider = locator<ApiProvider>();

  getDetails() {
    return _apiProvider.details();
  }

}