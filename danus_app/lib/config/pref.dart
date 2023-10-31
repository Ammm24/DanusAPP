import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session {
  final storage = const FlutterSecureStorage();

  final String userToken = "user_token";
  final String isIntroShow = "is_intro_show";
  final String userId = "user_id";

  Future<void> setUserToken(dynamic value) async {
    return await storage.write(key: userToken, value: value);
  }

  Future<String?> getUserToken() async {
    return await storage.read(key: userToken);
  }

  Future<void> setIntroShow() async {
    return await storage.write(key: isIntroShow, value: "true");
  }

  Future<String?> getIntroShow() async {
    return await storage.read(key: isIntroShow);
  }

  Future<void> setUserId(dynamic value) async {
    return await storage.write(key: userId, value: value);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: userId);
  }

  logout() async {
    await storage.delete(key: userToken);
    await storage.delete(key: isIntroShow);
    await storage.delete(key: userId);
  }
}
