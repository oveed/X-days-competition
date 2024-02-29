import 'package:app/screens/login.dart';
import 'package:app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Your App Title',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final green = Color(0xFF04D7B7);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/menu.svg',
              height: 40,
              width: 40,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/notification.svg',
                height: 30,
                width: 40,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xFF04D7B7),
        elevation: 0.0,
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(0)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF0086DC),
                    width: 1.5, // Change the width as needed
                  ),
                ),
              ),
              child: Container(
                child: Stack(
                  children: [
                    Center(),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        padding: EdgeInsets.fromLTRB(25, 0, 0, 25),
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/back-arrow.svg',
                      height: 30,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/phone.svg',
                      height: 30,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Numéros utiles',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/back-arrow.svg',
                      height: 25,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Règles de confidentialité',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyApp()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 300),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(20)),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text('Sign up'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(20)),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text('Sign in'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
