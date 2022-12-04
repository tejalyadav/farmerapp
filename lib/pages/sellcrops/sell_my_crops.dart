import 'package:flutter/material.dart';

class SellMyCrops extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'smart_kisan',
      home:  MyHomePage(title:'Smart Kisan' ),
      theme: ThemeData(
        primarySwatch: Colors.green,

      ),
    );

  }
}

class MyHomePage  extends StatelessWidget {
  var title;

  MyHomePage({Key ? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            title, style: TextStyle(fontFamily: 'Cinzel', color: Colors.white)),
      ),
    );

  }


}