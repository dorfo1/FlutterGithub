class Repositorio{
  String name;
  String language;


  Repositorio.fromJson(Map<String,dynamic> map){
    name = map["name"];
    language = map["language"];
  }
}