import 'dart:io';

import 'package:danus_app/config/endpoint.dart';
import 'package:danus_app/config/model/resp.dart';
import 'package:danus_app/config/network.dart';
import 'package:danus_app/config/pref.dart';

//LOGIC UNTUK MANGGIL API
class ProductViewmodel {
  Future<Resp> listProduct() async {
    String? token = await Session().getUserToken();

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp = await Network.getApiWithHeaders(Endpoint.listProductUrl, header);
    Resp data = Resp.fromJson(resp);
    return data;
  }

  Future<Resp> detailProduct({id}) async {
    String? token = await Session().getUserToken();

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp = await Network.getApiWithHeaders(
        "${Endpoint.listProductUrl}?id=$id", header);
    Resp data = Resp.fromJson(resp);
    return data;
  }
}
