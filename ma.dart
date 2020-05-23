import './next.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


// void initState(){
//   super.initState();
//   retr
// }
class helo extends StatefulWidget {
  @override
  _heloState createState() => _heloState();
}

class _heloState extends State<helo> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome to webfun',),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            Image.asset('assets/images/webfun.png',
            height: 50,
            width: 50,
            ),
            Image.asset('assets/images/welcome.png',
            height: 200,
            width: 400,
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  labelText: 'Name',
                ),
                onChanged: (text){
                  myvar=text;
                  setValues();
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Age',
                  labelText: 'Age',
                ),
                onChanged: (text1){
                  myvar1=text1;
                  setValues();
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Gender',
                  labelText: 'Gender',
                ),
                onChanged: (text2){
                  myvar2=text2;
                  setValues();
                },
              ),
            ),
            
            SizedBox(height: 40,),
            SizedBox(
              width: 300.0,
              height: 40.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)
              ),
                onPressed: () async{
                  getValue();
                  Navigator.of(context).push(MaterialPageRoute
                  (builder:(context)=>next(name:name,age:age,gender:gender),));
                },
                color: Colors.orange,
                child: Text('login',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Anton',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
                ),
                
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}


