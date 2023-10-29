import 'dart:io';

import 'package:danus_app/config/endpoint.dart';
import 'package:danus_app/config/model/resp.dart';
import 'package:danus_app/config/network.dart';
import 'package:danus_app/config/pref.dart';

class UserViewmodel {
  Future<Resp> userDetail() async {
    String? token = await Session().getUserToken();

    var header = <String, dynamic>{};
    header[HttpHeaders.authorizationHeader] = 'Bearer $token';

    var resp =
        await Network.postApiWithHeadersWithoutData(Endpoint.usersUrl, header);
    Resp data = Resp.fromJson(resp);
    return data;
  }

  // Future<Resp> userUpdateProfile({fullName, phone, File? avatarFile}) async {

  //   dynamic avatarFileName = (avatarFile != null && avatarFile != "") ? avatarFile.path.split('/').last : "";
  //   String? token = await Session().getUserToken();
  //   // Map<String, dynamic> formData;
  //   FormData formData;
  //   if (avatarFile != null){

  //     formData = FormData.fromMap({
  //       "fullname": fullName,
  //       "phone": phone,
  //       "avatar": await MultipartFile.fromFile(avatarFile.path, filename: avatarFileName),
  //     });
  //   } else {
  //     debugPrint("no avatar");
  //     formData = FormData.fromMap({
  //       "fullname": fullName,
  //       "phone": phone,
  //     });
  //   }

  //   var header = <String, dynamic>{};
  //   header[HttpHeaders.authorizationHeader] = 'Bearer $token';
  //   header['Content-Type'] = 'multipart/form-data';
  //   debugPrint("ini header update profile $header");
  //   debugPrint("ini formdata update profile:");

  //   for (var entry in formData.fields) {
  //     debugPrint("${entry.key}: ${entry.value}");
  //   }

  //   var resp = await Network.postApiWithHeadersContentType(
  //       Endpoint.userUpdateProfileUrl,formData, header);
  //   Resp data = Resp.fromJson(resp);
  //   // print(resp);
  //   return data;
  // }
}
