import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          ListTile(

            title: Text(
              'Logo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, color: Colors.black54),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          'Bands/Dj',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          'Car Rentals',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          'Caterers',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          'Health',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          'Fashion',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          'Flowers',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                        )),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
