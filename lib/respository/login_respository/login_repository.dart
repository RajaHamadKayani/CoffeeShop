import 'package:coffee_shop_app/data/network/network_url_response.dart';
import 'package:coffee_shop_app/res/app_urls/app_urls.dart';

class LoginRepository {
  NetworkUrlResponse networkApiResponse = NetworkUrlResponse();
  Future<dynamic> loginApi(dynamic data) async {
    final response = await networkApiResponse.postApi(data, AppUrls.loginUrl);
    return response;
  }
}
