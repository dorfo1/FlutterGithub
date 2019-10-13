class User {
  String login;
  int id;
  String avatarUrl;
  String htmlUrl;
  String name;
  int publicRepos;
  int followers;
  int following;

  User({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
    this.name,
    this.publicRepos,
    this.followers,
    this.following,
  });

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    htmlUrl = json['html_url'];
    name = json['name'];
    publicRepos = json['public_repos'];
    followers = json['followers'];
    following = json['following'];
  }
}
