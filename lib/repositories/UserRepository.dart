import 'dart:convert';

import 'package:flutter_github/models/User.dart';
import 'package:flutter_github/utils/ApiResponse.dart';
import 'package:http/http.dart' as http;

class UserRepository{


  static Future<ApiResponse<User>> fetchUserByLogin(String login) async{
    var url = "https://api.github.com/users/$login";
    try{
      var response = await http.get(url);
      if(response.statusCode==200){
        var user = User.fromJson(jsonDecode(response.body));
        return ApiResponse.ok(user);
      }
      return ApiResponse.error("Usuário não existe");
    }catch(error){
      return ApiResponse.error("Falha ao buscar usuário");
    }
  }

}