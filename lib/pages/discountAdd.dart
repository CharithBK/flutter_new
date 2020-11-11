import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_new/database/services.dart';
import 'package:flutter_new/pages/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDiscount extends StatefulWidget {
  @override
  _AddDiscountState createState() => _AddDiscountState();
}

class _AddDiscountState extends State<AddDiscount> {
  @override
  Widget build(BuildContext context) {
    //textBox=================
    TextEditingController nameController = new TextEditingController();
    TextEditingController descriptionController = new TextEditingController();
    TextEditingController percentageController = new TextEditingController();
    TextEditingController no_of_servicesController = new TextEditingController();

    void addDiscount() {
      Service.addDiscount(nameController.text, descriptionController.text,
              percentageController.text, no_of_servicesController.text)
          .then((result) {
        var message = json.decode(result);
        print(message);
        if (message['message'] == 'Save Success') {
          Fluttertoast.showToast(msg: 'Added New Discount');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            //page redirect to Discount List
          );
          //print("OK");
        } else {
          Fluttertoast.showToast(msg: message['message']);
          //print("error");
        }
      });
    }

    final name = TextField(
      controller: nameController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final description = TextField(
      controller: descriptionController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Description",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final percentage = TextField(
      controller: percentageController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Percentage",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final noOfServices = TextField(
      controller: no_of_servicesController,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Montserrat', fontSize: 15, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "No Of Services",
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
          addDiscount();
        },
        child: Text("Add Discount",
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
                  Text(" Programming Task ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.5,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 85.0),
                  name,
                  SizedBox(height: 25.0),
                  description,
                  SizedBox(height: 25.0),
                  percentage,
                  SizedBox(height: 25.0),
                  noOfServices,
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
