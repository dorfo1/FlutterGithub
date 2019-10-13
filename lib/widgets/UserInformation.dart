import 'package:flutter/material.dart';
import 'package:flutter_github/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.loading) {
          return Center(child: CircularProgressIndicator(),);
        }else if(userProvider.error){
          return Center(child: Text(userProvider.msg),);
        }else if(userProvider.user!=null){
          return Column(
            children: <Widget>[
              Image.network(userProvider.user.avatarUrl,height: 150,),
              Text(userProvider.user.name ?? "Nome não informado"),
              Text("Repositórios : ${userProvider.user.publicRepos}"),
              Text("Seguidores : ${userProvider.user.followers}"),
              Text("Seguindo : ${userProvider.user.following}"),
            ],
          );
        }else{
          return Container();
        }
      },
    );
  }
}
