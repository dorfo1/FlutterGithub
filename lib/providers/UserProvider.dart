import 'package:flutter/cupertino.dart';
import 'package:flutter_github/models/User.dart';
import 'package:flutter_github/repositories/UserRepository.dart';
import 'package:flutter_github/utils/ApiResponse.dart';

class UserProvider with ChangeNotifier{

  bool _loading = false;
  User _user;
  bool _error = false;
  String _msg;

  bool get loading => _loading;

  User get user => _user;

  bool get error => _error;

  String get msg => _msg;


  fetchUser(String userLogin) async {
    if (userLogin.isNotEmpty) {
      user = null;
      error = false;
      loading = true;
      ApiResponse<User> apiResponse = await UserRepository.fetchUserByLogin(
          userLogin);
      if (apiResponse.ok) {
        user = apiResponse.result;
      } else {
        error = true;
        msg = apiResponse.msg;
      }
      loading = false;
    }
  }


  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  set error(bool value) {
    _error = value;
    notifyListeners();
  }

  set msg(String value) {
    _msg = value;
  }


}