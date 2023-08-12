import 'dart:async';
import 'package:http/http.dart' as http;


//const baseUrl = "192.168.80.24";
const baseUrl = "192.168.15.6";
//const baseUrl = "http://localhost";

class readAPI {
  static Future getUsers() {
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      //path: 'C:/xampp/htdocs/getdata.php',
      //path: 'flutter/consultar.php',
      path: '/getdata.php',
    );
    return http.get(url as Uri);
  }
}

class addAPI {
  static Future addUsers(String login, String password) {
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/adddata.php?login=$login&password=$password',
    );
    return http.post(url as Uri);
  }
}