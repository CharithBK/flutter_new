import 'dart:convert';
import 'package:flutter_new/database/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Service {

  static Future<String> addDiscount(
    String name,
    String description,
    String percentage,
    String no_of_services,

  ) async {
    try {
      String token;
      var map = Map<String, dynamic>();
      map["name"] = name;
      map["description"] = description;
      map["percentage"] = percentage;
      map["no_of_services"] = no_of_services;
      print("==================================");
      print(map["name"]);
      print(map["description"]);
      print(map["percentage"]);
      print(map["no_of_services"]);
      final data = json.encode(map);
      print(data);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      token = preferences.getString('token');
      print(token);
       Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization" : "Bearer $token"
      };
      final response = await http.post(
          'http://ec2-3-16-10-62.us-east-2.compute.amazonaws.com/api/discounts/create',
          headers: headers,
          body: data);
      print(response.statusCode.toString());
      print("OK");
      return response.body.toString();
    } catch (e) {
      return "error";
    }
  }


  // static List<Order> parseResponse(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Order>((json) => Order.fromJson(json)).toList();
  // }

  //user login
  static Future<String> loginUser(
    String _grantType,
    String _clientId,
    String _clientSecret,
    String _username,
    String _password,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map["grant_type"] = _grantType;
      map["client_id"] = _clientId;
      map["client_secret"] = _clientSecret;
      map["username"] = _username;
      map["password"] = _password;
      print("gg");
      print(map["grant_type"]);
      final data = json.encode(map);
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
          'http://ec2-3-16-10-62.us-east-2.compute.amazonaws.com/api/user/api-token',
          headers: headers,
          body: data);
      print(response.statusCode.toString());

      var message = json.decode(response.body);
      print(message['message']);
      //return response.statusCode.toString();
      return response.body.toString();
    } catch (e) {
      return "error";
    }
  }
}
