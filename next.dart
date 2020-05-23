import 'package:as5/ma.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './main.dart';

class next extends StatefulWidget {
  String name;
  String age;
  String gender;
  next({this.name, this.age, this.gender});

  @override
  _nextState createState() => _nextState(name, age, gender);
}



class _nextState extends State<next> {
  String name;
  String age;
  String gender;
  _nextState(this.name, this.age, this.gender);
  @override
  void initState() {

    super.initState();
    getValue();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: Center(
                  child: Text(
                    '$name',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.pink,
                child: Center(
                  child: Text(
                    '$age',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    '$gender',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(
              width: 300.0,
              height: 40.0,
              child: RaisedButton(

                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () async {
                  getValue();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => helo(),

                  ));

                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.getKeys();
                  for (String key in preferences.getKeys()) {
                    if (key !=null) {
                      preferences.remove(key);
                    }
                  }
                },
                color: Colors.orange,
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
