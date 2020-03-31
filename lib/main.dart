import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';


void main(){runApp(MyApp());
 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.deepPurpleAccent
));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
        

    return MaterialApp(
       debugShowCheckedModeBanner: false,


      theme: ThemeData(
        // primaryColor: Color(0xff437089),
        primaryColor: Colors.deepPurpleAccent,
        fontFamily: 'JosefinSans'
      ),
      title: "Quiz App",
      home: HomeScreen(),
    );
  }
}