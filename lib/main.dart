import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_adoption_app/presentation/screens/bottom.dart';
import 'package:pet_adoption_app/presentation/screens/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
      // BottomS(),
    );
  }
}
