import 'package:flutter/material.dart';
import 'package:flutter_github/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class UserInput extends StatelessWidget {
  var userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: userTextController,
                decoration: InputDecoration(
                    labelText: "Digite seu login do github",
                    contentPadding: EdgeInsets.all(2)),
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              "Buscar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () => userProvider.fetchUser(userTextController.text),
          )
        ],
      );
    });
  }
}
