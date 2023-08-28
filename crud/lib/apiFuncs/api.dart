import 'dart:async';
import 'package:http/http.dart' as http;


const baseUrl = "sotreinamentos.com.br";

class readAPI {
  static Future getUsers() {
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/tcc/getdata.php',
    );
    return http.get(url as Uri);
  }
}

class addAPI {
  static Future addUsers(String login, String password) {
    final Parameters = {
      'login': login,
      'password': password,
    };
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/tcc/adddata.php',queryParameters: Parameters
    );
    return http.post(url as Uri);
  }
}