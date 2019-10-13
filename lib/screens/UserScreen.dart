import 'package:flutter/material.dart';
import 'package:flutter_github/providers/UserProvider.dart';
import 'package:flutter_github/repositories/UserRepository.dart';
import 'package:flutter_github/screens/RepositoriosScreen.dart';
import 'package:flutter_github/widgets/UserInformation.dart';
import 'package:flutter_github/widgets/UserInput.dart';

import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Usuário"),
      ),
      body: _body(),
    );
  }

  _body() {
    return ChangeNotifierProvider(
      builder: (context) => UserProvider(),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UserInput(),
            UserInformation(),
            _buttonRepositorios()
          ],
        ),
      ),
    );
  }

  _buttonRepositorios() {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return userProvider.user != null
          ? FlatButton(
              child: Text("Visualizar repositórios",style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.w300,decoration: TextDecoration.underline),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoriosScreen(userProvider.user.login)));
              },
            )
          : Container();
    });
  }
}
