import 'package:flutter/material.dart';
import 'package:farmerapp/classes/language.dart';
import 'package:farmerapp/classes/language_constants.dart';
import 'package:farmerapp/main.dart';
import 'package:farmerapp/router/route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:farmerapp/pages/weather/screens/homeScreen.dart';
import 'package:farmerapp/pages/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
  int currentIndex = 0;
  final screens = [
    Home(),
    WHomescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).smartkisan, style: TextStyle(fontFamily: 'Cinzel', color: Colors.white)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) =>
                    DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          //Text(
                           // e.flag,
                           // style: const TextStyle(fontSize: 30),
                          //),
                          Text(e.name)
                        ],
                      ),
                    ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.lightGreen,

        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: translation(context).home,
            backgroundColor: Colors.lightGreen,
          ),

          BottomNavigationBarItem(
            icon:Icon(Icons.cloud),
            label: translation(context).weather,
            backgroundColor: Colors.lightGreen,
          ),

          BottomNavigationBarItem(
            icon:Icon(Icons.chat),
            label: translation(context).chat,
            backgroundColor: Colors.lightGreen,
          ),
        ],

      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: _drawerList(),
      ),
      //body:

    );
  }

  Container _drawerList() {
    TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: const CircleAvatar(),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).aboutUs,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).settings,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}

