import 'package:flutter/material.dart';
import 'package:pet_adoption_app/presentation/screens/history.dart';
import 'package:pet_adoption_app/presentation/screens/home.dart';
import 'package:pet_adoption_app/presentation/screens/pets.dart';
import 'package:pet_adoption_app/presentation/screens/settings.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedTab = 0;

  List<Widget> widgetList = [
    const HomeScreen(),
    const PetsScreen(),
    HistoryScreen(),
    const SettingScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          bottomNavigationBarTheme:
              BottomNavigationBarTheme.of(context).copyWith(
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        home: Scaffold(
          backgroundColor: Colors.black,
          body: widgetList[_selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (index) => _changeTab(index),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            // backgroundColor: Colors.blueAccent,
            // elevation: 10,

            // backgroundColor: Colors.transparent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Pets"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "History"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setting"),
            ],
          ),
        ));
  }
}
