class ApiResponse<T>{

  bool _ok;
  String _msg;
  T _result;

  ApiResponse.ok(this._result){
    _ok = true;
  }

  ApiResponse.error(this._msg){
    _ok = false;
  }

  T get result => _result;

  String get msg => _msg;

  bool get ok => _ok;


}