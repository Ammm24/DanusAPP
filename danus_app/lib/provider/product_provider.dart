import 'dart:io';

import 'package:danus_app/config/endpoint.dart';
import 'package:danus_app/config/model/resp.dart';
import 'package:danus_app/config/network.dart';
import 'package:danus_app/config/pref.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  Resp? _productData;

  Resp? get productData => _productData;

  ProductProvider() {
    fetchProductData();
  }

  Future<void> fetchProductData() async {
    try {
      String? token = await Session().getUserToken();

      var header = <String, dynamic>{};
      header[HttpHeaders.authorizationHeader] = 'Bearer $token';

      var resp =
          await Network.getApiWithHeaders(Endpoint.listProductUrl, header);
      _productData = Resp.fromJson(resp);
      debugPrint("notifyyyyyy");
      debugPrint("ini yaa $_productData");

      notifyListeners();
      // return _productData;
    } catch (error) {
      notifyListeners();

      debugPrint('Error fetching product data: $error');
    }
  }
}
