import 'package:flutter/material.dart';
//import 'package:smart_kisan/model/language_model.dart';
//import 'guide_me.dart';
//import 'sell_my_crops.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:farmerapp/pages/guideme/guide_me.dart';
import 'package:farmerapp/pages/sellcrops/sell_my_crops.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'smart_kisan',
      home:  MyHomePage(title:'Smart Kisan' ),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,

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
           // "Smart Kisan", style: TextStyle(fontFamily: 'Cinzel', color: Colors.white)),


      //),

      body: Center(

        child: Column(

          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/farmers_tractor.jpg',
                height: 250,
                width: 250),

            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black),
                  primary: Colors.lightGreen,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {
                  //_askCameraPermission();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new GuideMe(),
                  ));
                },
                label: Text('Guide Me'),
                icon: Icon(Icons.man),
              ),),

            Image.asset('assets/images/sell_my_crops.jpg',
                height: 250,
                width: 250),

            SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(color: Colors.black),
                  primary: Colors.lightGreen,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {

                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new SellMyCrops(),
                  ));
                },
                label: Text('Sell My Crop'),
                icon: Icon(Icons.shopping_cart),
              ),),
          ],


        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
