import 'package:flutter/material.dart';
import 'Constants/constants.dart';
import 'Screens/appointment.dart';
import 'Screens/home.dart';
import 'Screens/login.dart';
import 'Screens/profile.dart';
import 'Screens/search_screen.dart';
import 'Screens/slotsscreen.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SlotsScreen(),
      home: LoginScreen(),
     // home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
     final _screens = [
      HomeScreen(),
      const AppointmentScreen(),
      const SearchScreen(),
       ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined,color: primarycolor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined,color: primarycolor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: primarycolor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: primarycolor),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}