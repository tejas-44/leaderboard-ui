import 'package:flutter/material.dart';
import 'package:leaderboard_ui/screens/Leaderboard.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Leaderboard',
        routes: {
          '/Leaderboard': (context) => Leaderboard(),

        },
      );
    });
  }
}
