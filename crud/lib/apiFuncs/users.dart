class GetUser {
  String idUser;
  String login;
  String password;

  //construtor
  GetUser(this.idUser, this.login, this.password);

  GetUser.fromJson(Map json)
      : idUser = json['idUser'],
        login = json['login'],
        password = json['password'];

  Map toJson() {
    return {'idUser': idUser, 'login': login, 'password': password};
  }
}

class userEXPanel {
  userEXPanel({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class addUser {
  String name;
  String email;
  String phone;

  addUser(this.name, this.email, this.phone);

  addUser.toJson(Map json)
      : name = json['name'],
      email = json['email'],
      phone = json['phone'];

  Map toJson() {
    return {'name': name, 'email': email, 'phone': phone};
  }
}
