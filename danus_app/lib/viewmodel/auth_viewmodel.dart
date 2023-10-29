import 'package:danus_app/config/endpoint.dart';
import 'package:danus_app/config/model/resp.dart';
import 'package:danus_app/config/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthViewmodel {
  Future<Resp> register(
      {name, email, phone, password, confirmPassword, nrp}) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "nrp": nrp,
      "phoneNumber": phone,
      "password": password,
      "password_confirmation": confirmPassword,
    });

    var resp = await Network.postApi(Endpoint.registerUrl, formData);
    debugPrint("ini rep $resp");
    var data = Resp.fromJson(resp);
    return data;
  }

  Future<Resp> login({email, password}) async {
    Map<String, dynamic> formData = {
      "email": email,
      "password": password,
    };

    var resp = await Network.postApi(Endpoint.loginUrl, formData);
    var data = Resp.fromJson(resp);
    return data;
  }
}
