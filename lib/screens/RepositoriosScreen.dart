import 'package:flutter/material.dart';
import 'package:flutter_github/providers/RepositoriosProvider.dart';
import 'package:flutter_github/widgets/ReposItem.dart';
import 'package:provider/provider.dart';

class RepositoriosScreen extends StatelessWidget {

  String login;
  var repositorioProvider = RepositoriosProvider();

  RepositoriosScreen(this.login) {
    repositorioProvider.fetchReposByLogin(login);
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => repositorioProvider,
        child: Scaffold(
          appBar: AppBar(title: Text("Repositórios de $login"),),
          body: _body(context),
        ));
  }

  _body(context) {
    return Consumer<RepositoriosProvider>(
      builder: (context, reposProvider, child) {
        if(reposProvider.loading){
          return Center(child: CircularProgressIndicator(),);
        }else if(reposProvider.error){
          return Center(child: Text(reposProvider.msg),);
        }else{
          return ListView.builder(itemBuilder: (context, index) =>
              ReposItem(reposProvider.repos[index]),
            itemCount: reposProvider.tamanhoListaDeRepos(),
          );
        }

      },
    );
  }
}
