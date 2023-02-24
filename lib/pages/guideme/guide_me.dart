import 'package:flutter/material.dart';
import 'market_price.dart';
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

        child:  Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Image.asset('assets/images/which_crop.jpg',
                //height: 100,
                //width: 100),


            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  //shape: StadiumBorder(),
                  side: BorderSide(color: Colors.green),
                  primary: Colors.lightGreen,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {
                  //_askCameraPermission();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new MarketPrice(),
                  ));
                },
                label: Text('Market Price', style: TextStyle( color: Colors.white, fontSize: 22 )),
                icon: Icon(Icons.attach_money, size: 30),
              ),),

            //Image.asset('assets/images/Warehouses.jpg',
                //height: 100,
                //width: 100),


            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  //shape: StadiumBorder(),
                  side: BorderSide(color: Colors.green),
                  primary: Colors.lightGreen,
                  minimumSize: const Size.fromHeight(55), // NEW
                ),
                onPressed: () {
                  //_askCameraPermission();
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                    new Warehouses(),
                  ));
                },
                label: Text('Warehouse  location', style: TextStyle( color: Colors.white, fontSize: 22 )),
                icon: Icon(Icons.home_work , size: 30),
              ),),





          ],

        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
