import 'package:flutter/material.dart';
import 'package:flutter_github/models/Repositorio.dart';
import 'package:flutter_github/repositories/GitRepository.dart';

class RepositoriosProvider with ChangeNotifier{

  List<Repositorio> _repos = [];
  bool _loading = false;
  bool _error = false;
  String _msg;

  List<Repositorio> get repos => _repos;

  set repos(List<Repositorio> value) {
    _repos = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool get error => _error;

  set error(bool value) {
    _error = value;
    notifyListeners();
  }

  String get msg => _msg;

  set msg(String value) {
    _msg = value;
  }

  fetchReposByLogin(String login) async {
      if(login.isNotEmpty){
        loading = true;
        error = false;
        limparRepos();
        var apiResponse = await GitRepository.fetchRepositories(login);
        if(apiResponse.ok){
          repos = apiResponse.result;
          loading = false;
        }else{
          error = true;
          msg = apiResponse.msg;
        }
      }
  }

  int tamanhoListaDeRepos(){
    return _repos.length;
  }

  void limparRepos() {
    _repos.clear();
    notifyListeners();
  }


}