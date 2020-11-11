import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/database/order.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'discountAdd.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token;
  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }
  Future<List<Order>> _loadUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString('token');
    List<Order> orderList = [];
     Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.get(
        "http://ec2-3-16-10-62.us-east-2.compute.amazonaws.com/api/discounts/index?search=&orderby=created_at&order=desc",
        headers: headers);
    var message = json.decode(response.body);
    var data = message['data'];
    //print(data);

    for (var u in data) {
      Order order = Order(u["id"], u["name"], u["description"], u["percentage"],
          u["no_of_services"], u["status"]);
      orderList.add(order);
    }

    print(orderList.length);
    return orderList;
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.green,
        title: Text('Discount List'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Fluttertoast.showToast(msg: 'Add Discounts');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new AddDiscount()));
              }),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Logout');
              logOut(context);
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: _loadUserDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("Id: " + snapshot.data[index].id),
                    subtitle: Text("Name:  " +
                        snapshot.data[index].name +
                        "\n" +
                        "Description:  " +
                        snapshot.data[index].description +
                        "\n" +
                        "Percentage:  " +
                        snapshot.data[index].percentage +
                        "\n" +
                        "No Of Services:  " +
                        snapshot.data[index].no_of_services +
                        "\n" +
                        "Status:  " +
                        snapshot.data[index].status +
                        "\n" +
                        "\n"),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
