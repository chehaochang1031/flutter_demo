import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  static final ApiService instance = ApiService._internal();

  factory ApiService() {
    return instance;
  }

  ApiService._internal();

  var dio = Dio();

  Future<bool?> checkAccountIsRegister(String account) async {
    var response = await dio.request(
      'https://ppms.ezplus.com.tw/laravel-push/api/security-user/check?account=$account',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      var result = response.data;
      var msg = result["message"];
      if (msg == '手機號碼已註冊') {
        return true;
      } else {
        return false;
      }
      // "result": "success",
      // "message": "手機號碼未註冊"
    }
    return null;
  }
}
