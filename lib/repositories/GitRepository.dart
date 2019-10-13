import 'dart:convert';

import 'package:flutter_github/models/Repositorio.dart';
import 'package:flutter_github/utils/ApiResponse.dart';
import 'package:http/http.dart' as http;

class GitRepository{


  static Future<ApiResponse<List<Repositorio>>> fetchRepositories(String login) async {
    try{
      var response = await http.get("https://api.github.com/users/${login}/repos");
      if(response.statusCode==200){
        List list  = jsonDecode(response.body);
        var repos =  list.map<Repositorio>((map) => Repositorio.fromJson(map)).toList();
        return ApiResponse.ok(repos);
      }else{
        return ApiResponse.error("Falha ao buscar repositórios");
      }
    }catch(_){
      return ApiResponse.error("Falha ao buscar repositórios");
    }


  }
}