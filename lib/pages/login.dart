import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_new/database/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/pages/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_new/pages/registration.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {

    TextEditingController numberController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    void loginUser () {
      if(numberController.text.isEmpty|| passwordController.text.isEmpty){
        Fluttertoast.showToast(msg: "Field cannot be Empty");
      }else{
        Service.loginUser(numberController.text, passwordController.text)
            .then((result) {
          var message = json.decode(result);

          if (message['message'] == 'Successfully login') {
            Fluttertoast.showToast(msg: message['message']);
               Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => Home()),
                 //page redirect to Login
               );
            //print("OK");
          } else if(message['message'] == 'Unauthorized Login') {
            Fluttertoast.showToast(msg: message['message']);
            //print("error");
          }
        });
      }




      // if(numberController.text.isEmpty|| passwordController.text.isEmpty)
      // {
      //   Fluttertoast.showToast(msg: "Field cannot be Empty");
      // }else{
      //
      //   Service.loginUser(
      //     numberController.text,
      //     passwordController.text,
      //   ).then((result) {
      //
      //   });
      //

      // }



    }

    final  number = TextField(
      controller: numberController,
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Number",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final  password = TextField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
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
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          loginUser();
        },
        child: Text("Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    var textValue = "Sign Up" ;

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
                  Text(" Logo ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.5,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 85.0),
                  number,
                  SizedBox(height: 25.0),
                  password,
                  SizedBox(height: 35.0),
                  loginButton,
                  SizedBox(height: 15.0),
                  Text("Don't have an account ?"),
                  SizedBox(height: 15.0),
                  InkWell(
                   child: Text(textValue ,style: TextStyle(
                     decoration: TextDecoration.underline, fontSize: 17
                   ),),
                   onTap: () { Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Registration()),
                     //page redirect to Login
                   );       },
          ),
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
