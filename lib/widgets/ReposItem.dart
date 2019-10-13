import 'package:flutter/material.dart';
import 'package:flutter_github/models/Repositorio.dart';

class ReposItem extends StatelessWidget {

  Repositorio repositorio;


  ReposItem(this.repositorio);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repositorio.name),
      subtitle: Text(repositorio.language ?? "Sem linguagem"),
    );
  }
}
