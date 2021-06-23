
import 'package:blog/utility/api_provider.dart';
import 'package:blog/utility/locator.dart';

class PostsRepository{
  ApiProvider _apiProvider = locator<ApiProvider>();

  getPosts() {
    return _apiProvider.getPosts();
  }

}