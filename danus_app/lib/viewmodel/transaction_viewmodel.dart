import 'dart:io';

import 'package:danus_app/config/endpoint.dart';
import 'package:danus_app/config/model/resp.dart';
import 'package:danus_app/config/network.dart';
import 'package:danus_app/config/pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransactionViewmodel {
  Future<Resp> allTransaction() async {
    String? token = await Session().getUserToken();

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp =
        await Network.getApiWithHeaders(Endpoint.allTransactionUrl, header);
    Resp data = Resp.fromJson(resp);
    return data;
  }

  Future<Resp> checkout(
      {paymentType,
      foodId,
      userId,
      qty,
      total,
      status,
      paymentUrl,
      required File bukti}) async {
    dynamic buktiFileName =
        (bukti != null && bukti != "") ? bukti.path.split('/').last : "";

    String? token = await Session().getUserToken();

    FormData formData;
    debugPrint(
        "image ${await MultipartFile.fromFile(bukti.path, filename: buktiFileName)}");
    debugPrint("userid ${userId.runtimeType}");

    formData = FormData.fromMap({
      "food_id": foodId,
      "user_id": userId,
      "quantity": qty,
      "total": total,
      "payment_type": paymentType,
      "status": status,
      "payment_url": paymentUrl,
      "image":
          await MultipartFile.fromFile(bukti.path, filename: buktiFileName),
    });

    var buktiFile =
        await MultipartFile.fromFile(bukti.path, filename: buktiFileName);

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';
    header['Content-Type'] = 'multipart/form-data';
    // debugPrint("ini form data checkout $formData.");
    for (var field in formData.fields) {
      debugPrint("Key: ${field.key}, Value: ${field.value}");
    }

    var resp = await Network.postApiWithHeaders(
        Endpoint.checkoutUrl, formData, header);
    Resp data = Resp.fromJson(resp);
    print("ini respon checkout $resp");
    return data;
  }
}
