import 'package:flutter/material.dart';
import 'which_crop.dart';
import 'where_to_sell.dart';
import 'where_to_store.dart';

class GuideMe extends StatelessWidget {
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
      //appBar: AppBar(
      //title: Text(
      // title, style: TextStyle(fontFamily: 'Cinzel', color: Colors.white)),
      //),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/which_crop.jpg',
                height: 100,
                width: 100),


            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black),
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {
                  //_askCameraPermission();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new WhichCrop(),
                  ));
                },
                label: Text('Crop Recommendation'),
                icon: Icon(Icons.light),
              ),),

            Image.asset('assets/images/Warehouses.jpg',
                height: 100,
                width: 100),


            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black),
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {
                  //_askCameraPermission();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new Warehouses(),
                  ));
                },
                label: Text('Warehouse  location'),
                icon: Icon(Icons.light),
              ),),

            Image.asset('assets/images/Where_to_sell.jpg',
                height: 100,
                width: 100),


            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black),
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {
                  //_askCameraPermission();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new WhereSell(),
                  ));
                },
                label: Text('Where to sell?'),
                icon: Icon(Icons.light),
              ),),
          ],

        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
