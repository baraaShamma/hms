import 'dart:convert';

import 'package:hms/model/auth/login_model.dart';
import 'package:hms/model/auth/sigup_model.dart';
import 'package:hms/utils/my_string.dart';
import 'package:http/http.dart' as http;

class Authentication {

  static Future<LoginModel> login(String email, String password,String token) async {

    var data = {"email": email, "password": password, "token": token};
    var response = await http.post(Uri.parse('$baseUrl/login.php'), body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
    //  var responseBody = json.decode(response.body);
      final List<String> sensastionList = [jsonData];

      return loginModelFromJson(jsonData);

    } else {
      return throw Exception("Failed to load categories");
    }
  }

  static Future<SigupModel> signUp(String name_user, String email,
      String password, String phone, String address) async {
    var data = {
      "username": name_user,
      "email": email,
      "password": password,
      "phon": phone,
      "address": address
    };

    var response =
        await http.post(Uri.parse('$baseUrl/signup.php'), body: data);

    if (response.statusCode == 200) {
      var jsonData = response.body;

      return sigupModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load categories");
    }
  }
}
