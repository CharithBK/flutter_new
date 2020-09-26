import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {

  static Future<String> addUser(
  String language,
  String number,
  String firstName,
  String lastName,
  String password,
  String confirmPassword,
      )
  async {

    try {
      var map = Map<String, dynamic>();
      map["language"] = language;
      map["mobile_no"] = number;
      map["first_name"] = firstName;
      map["last_name"] = lastName;
      map["password"] = password;
      map["password_confirmation"] = confirmPassword;
      print(map["language"]);
      print(map["mobile_no"]);
      print(map["first_name"]);
      print(map["last_name"]);
      print(map["password"]);
      print(map["password_confirmation"]);
      final data = json.encode(map);
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
          'https://wooju.liyumalk.tk/api/registerappuser',
          headers: headers,
          body: data);
      print(response.statusCode.toString());
      return response.statusCode.toString();

      print('addUser Response: ${response.body}');
      if (200 == response.statusCode) {
        print("gg");

        print("gg1212");
        return response.body;

      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //user login
  // static Future<String> loginUser(
  //     String _number,
  //     String _password,
  //     ) async {
  //   try {
  //     var map = Map<String, dynamic>();
  //     map["phone_no"] = _number;
  //     map["password"] = _password;
  //     final data = json.encode(map);
  //     Map<String, String> headers = {"Content-type": "application/json"};
  //     final response = await http.post('https://wooju.liyumalk.tk/api/login',
  //         headers: headers,
  //         body: data);
  //     print(response.statusCode);
  //     return response.statusCode.toString();
  //
  //     if (200 == response.statusCode) {
  //       print("logged User: ${response.body}");
  //       return response.body;
  //     } else {
  //       return "error";
  //     }
  //   } catch (e) {
  //     return "error";
  //   }
  // }

  //user login
  static Future<String> loginUser(
      String _number,
      String _password,
      ) async {
    try {

      var map = Map<String, dynamic>();
      map["phone_no"] = _number;
      map["password"] = _password;
      final data = json.encode(map);
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post('https://wooju.liyumalk.tk/api/login',headers: headers,body: data);
      print(response.statusCode.toString());

      var message = json.decode(response.body);
      print(message['message']);
      //return response.statusCode.toString();
      return response.body.toString();



    } catch (e) {
    return "error";}
  }


    }