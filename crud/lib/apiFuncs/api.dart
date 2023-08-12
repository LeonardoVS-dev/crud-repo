import 'dart:async';
import 'package:http/http.dart' as http;


const baseUrl = "192.168.15.6";
//const baseUrl = "http://localhost";

class getAPI {
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

class postAPI {
  static Future postUsers(String name, String email, String phone) {
    var url = Uri(
      scheme: 'http',
      host: baseUrl,
      path: '/adddata.php',
    );
    return http.post(url as Uri);
  }
}
