import 'dart:convert';

import 'package:coffee_shop_app/data/network/base_url_response.dart';
import 'package:coffee_shop_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkUrlResponse extends BaseUrlResponse {
  @override
  Future getApi(String url) async {
    try {
      dynamic decodedRespone;
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      decodedRespone = returnResponse(response);
      return decodedRespone;
    } catch (e) {
      Utils.toastMessage("Coffee Shop", e.toString());
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic decodedResponse = jsonDecode(response.body);
        return decodedResponse;
      default:
        return const Text("Something went wrong");
    }
  }

  @override
  Future postApi(data, String url) async {
    try {
      dynamic decodedResponse;
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      decodedResponse = returnResponse(response);
      return decodedResponse;
    } catch (e) {
      Utils.toastMessage("Coffee Shop", e.toString());
    }
  }
}
