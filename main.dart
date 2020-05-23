import './next.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ma.dart';

void main() {
  runApp(MyApp());
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
      title: 'hii',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String myvar;
  String myvar1;
  String myvar2;
  String name;
  String age;
  String gender;

  @override
  void initState() {

    super.initState();
    getValue();

  }
  void setValues() async{
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    sharedpref.setString('name', '$myvar');
    sharedpref.setString('age', '$myvar1');
    sharedpref.setString('gender', '$myvar2');
    print('$myvar');
    print('$myvar1');
    print('$myvar2');
    }




  void getValue() async{
      
    print('get value fiunction');
    SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    setState(() {
    name =sharedprefs.getString('name');
    age =sharedprefs.getString('age');
    gender =sharedprefs.getString('gender');
   });
  }

  @override
  
  Widget build(BuildContext context) {
    return (name!=null) ? next() : helo();
  }
}


