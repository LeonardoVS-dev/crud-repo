class readUser {
  String idUser;
  String login;
  String password;

  //construtor
  readUser(this.idUser, this.login, this.password);

  readUser.fromJson(Map json)
      : idUser = json['idUser'],
        login = json['login'],
        password = json['password'];

  Map toJson() {
    return {'idUser': idUser, 'login': login, 'password': password};
  }
}

class userEXPanel{
  userEXPanel({
    required this.id,
    required this.login,
    required this.password,
    this.isExpanded = false,
  });

  String id;
  String login;
  String password;
  bool isExpanded;
}


