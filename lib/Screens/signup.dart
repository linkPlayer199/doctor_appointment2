import 'dart:convert';

import 'package:doctor_appointment2/Widgets/alertdialogue.dart';
import 'package:doctor_appointment2/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Constants/constants.dart';
import '../Widgets/BaseHelper.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController name=TextEditingController();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  Future register(String name,String email,String password)async{
    var data=await http.post(Uri.parse('https://doclive.info/api/register'), body: {
     'name':name,
      'email':email,
      'password':password,

    });
    if(data.statusCode==201){
      BaseHelper.id=json.decode(data.body);
      BaseHelper.ids=BaseHelper.id['user']['id'];
      BaseHelper.name=BaseHelper.id['user']['name'];
      BaseHelper.email=BaseHelper.id['user']['email'];
      print( BaseHelper.ids);
      print(data.body);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigationBarExample()));
    }
    else{
    context.showerrordialogue(data.body);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Doctor Appointment',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Full Name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final nametext=name.text.toString();
                final emailtext= email.text.toString();
                final passtext=password.text.toString();
                register(nametext,emailtext,passtext);

                // Handle signup action
              },
              child: Text('SIGN UP',style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                textStyle: TextStyle(

                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle login instead action
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                'Already have an account? Login instead',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
