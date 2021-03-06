import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:user_test_app/data/models/user_model.dart';

class ApiServices{

   Future<List<UserModel>> getUsers() async {
      List<UserModel> results = [];
      final uri = Uri.parse('https://randomuser.me/api/?page=0&results=20');
      final response = await http.get(uri);
      final stringJson = utf8.decode(response.bodyBytes);
      try {
         Map<String, dynamic> mapJson = jsonDecode(stringJson);
         results = List<UserModel>.from(
            mapJson["results"].map(
                   (x) => UserModel.fromJson(x),
            ),
         );
      } catch (ex) {
         if (kDebugMode) {
            print(ex);
         }
      }
      return results;
   }
}