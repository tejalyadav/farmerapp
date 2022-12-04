import 'package:flutter/material.dart';
import 'package:farmerapp/router/custom_router.dart';
import 'package:farmerapp/router/route_constants.dart';
import 'package:farmerapp/classes/language_constants.dart';


import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FirstScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                children: [


                  Image.asset('assets/images/khet.jpg',
                    height: 600,
                    width: double.infinity,
                  ),

                  Center(
                      child: Text("Smart Kisan", style: TextStyle(
                          fontFamily: 'Cinzel',
                          color: Colors.green,
                          fontSize: 55,
                          fontWeight: FontWeight.bold))
                  ),


                  //FlowerImageAsset(),
                  SizedBox(height: 10),

                  SizedBox(
                    height: 90,

                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //shape: StadiumBorder(),
                          side: BorderSide(color: Colors.lightGreen),
                          primary: Colors.lightGreen,
                          minimumSize: const Size.fromHeight(65), // NEW
                        ),
                        child: Text("Let's Go", style: TextStyle(
                            fontFamily: 'Cinzel',
                            color: Colors.white,
                            fontSize: 18)),
                        onPressed: () {

                          Navigator.pushNamed(context, homeRoute);

                        }
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }



}
