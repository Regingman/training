import 'package:flutter/material.dart';
import 'package:training/google_map.dart';
import 'package:training/shop_ui.dart';
import 'package:training/ui_tab_anim.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => ShopUI(),
        '/second': (BuildContext context) => UiTabAnimation(),
        '/third': (BuildContext context) => GoogleMapExample(),
      },
    );
  }
}

class App extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test ideas"),
      ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RaisedButton(
                child: Text("Shop ui test"),
                onPressed: () {
                  Navigator.pushNamed(context, '/first');
                },
              ),
              RaisedButton(
                child: Text("Ui tab Animation"),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
              RaisedButton(
                child: Text("google map Example"),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
