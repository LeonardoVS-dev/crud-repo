import 'dart:async';
import 'package:http/http.dart' as http;


const baseUrl = "antistatic-runout.000webhostapp.com";

class readAPI {
  static Future getUsers() {
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/getdata.php',
    );
    print(url);
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
      path: '/adddata.php',queryParameters: Parameters
    );
    print(url);
    return http.post(url as Uri);
  }
}

class delAPI {
  static Future delUsers(String idUser,) {
    final Parameters = {
      'idUser': idUser,
    };
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/deletedata.php',queryParameters: Parameters
    );
    print(url);
    return http.post(url as Uri);
  }
}
