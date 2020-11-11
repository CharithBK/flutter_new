import 'package:flutter/material.dart';
import 'package:flutter_new/pages/home.dart';
import 'package:flutter_new/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Home(),
  ));
}
