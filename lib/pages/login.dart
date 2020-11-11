import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_new/database/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/pages/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //textBox=================
    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController grantTypeController = new TextEditingController();
    TextEditingController clientIdController = new TextEditingController();
    TextEditingController clientSecretController = new TextEditingController();
    String token;
//login==========================
    Future<void> loginUser() async {
      if (grantTypeController.text.isEmpty ||
          clientIdController.text.isEmpty ||
          clientSecretController.text.isEmpty ||
          usernameController.text.isEmpty ||
          passwordController.text.isEmpty) {
        Fluttertoast.showToast(msg: "Field cannot be Empty");
      } else {
        Service.loginUser(
                grantTypeController.text,
                clientIdController.text,
                clientSecretController.text,
                usernameController.text,
                passwordController.text)
            .then((result) async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          var message = json.decode(result);
          token = message['access_token'];
          print(token);
          if (message['token_type'] == 'Bearer') {
            Fluttertoast.showToast(msg: message['message']);
            sharedPreferences.setString('token', token);
            //var token = sharedPreferences.getString("token");
            print(token);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              //page redirect to Login
            );
            //print("OK");
          } else if (message['message'] ==
              'The provided authorization grant (e.g., authorization code, resource owner credentials) or refresh token is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client.') {
            Fluttertoast.showToast(msg: message['message']);
            //print("error");
          }
        });
      }
    }

    final username = TextField(
      controller: usernameController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final grantType = TextField(
      controller: grantTypeController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Grant Type",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final clientId = TextField(
      controller: clientIdController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Client Id",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final clientSecret = TextField(
      controller: clientSecretController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Client Secret",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          loginUser();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0)
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );



    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" Programming Task  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.5,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 85.0),
                  grantType,
                  SizedBox(height: 25.0),
                  clientId,
                  SizedBox(height: 25.0),
                  clientSecret,
                  SizedBox(height: 25.0),
                  username,
                  SizedBox(height: 25.0),
                  password,
                  SizedBox(height: 35.0),
                  loginButton,
                  SizedBox(height: 15.0),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
