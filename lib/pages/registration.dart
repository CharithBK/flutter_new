import 'package:flutter/material.dart';
import 'package:flutter_new/database/services.dart';
import 'package:flutter_new/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController numberController = new TextEditingController();
  TextEditingController languageController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  void registerUser(){
  if( languageController.text.isEmpty || numberController.text.isEmpty || firstNameController.text.isEmpty || lastNameController.text.isEmpty|| passwordController.text.isEmpty|| confirmPasswordController.text.isEmpty ){
     Fluttertoast.showToast(msg: "Field Cannot Be Empty");
      }else{
    if( passwordController.text == confirmPasswordController.text){
      Service.addUser(
        languageController.text,
        numberController.text,
        firstNameController.text,
        lastNameController.text,
        passwordController.text,
        confirmPasswordController.text,
      ).then((result) {
        if (result == '200') {
          Fluttertoast.showToast(msg: 'Added New User');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
            //page redirect to Login
          );
          //print("OK");
        } else if(result == '422') {
          Fluttertoast.showToast(msg: 'The mobile no has already been taken.');
          //print("error");
        }
      });

    } else{
      Fluttertoast.showToast(msg: 'Password not matched');
    }

  }


  }


  @override
  Widget build(BuildContext context) {

    final  language = TextField(

      controller: languageController,
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Language",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
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
    final  firstName = TextField(
      controller: firstNameController,
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "First Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final  lastName = TextField(
      controller: lastNameController,
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last Name",
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
    final  confirmPassword = TextField(
      controller: confirmPasswordController,
      obscureText: true,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
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
          registerUser();
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    var textValue = "Sign In" ;


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
                  SizedBox(height: 65.0),
                  language,
                  SizedBox(height: 15.0),
                  number,
                  SizedBox(height: 15.0),
                  firstName,
                  SizedBox(height: 15.0),
                  lastName,
                  SizedBox(height: 15.0),
                  password,
                  SizedBox(height: 15.0),
                  confirmPassword,
                  SizedBox(height: 35.0),
                  loginButton,
                  SizedBox(height: 15.0),
                  Text("Already have an account ?"),
                  SizedBox(height: 15.0),
                  InkWell(
                    child: Text(textValue ,style: TextStyle(
                      decoration: TextDecoration.underline,fontSize: 17
                    ),),
                    onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
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
