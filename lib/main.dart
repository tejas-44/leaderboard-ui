import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard_ui/screens/Leaderboard.dart';
import 'package:leaderboard_ui/screens/test_screen.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData(fontFamily: 'WorkSans'),
        // theme: ThemeData.dark(fontFamily: 'Roboto Regular').copyWith(fontFamily: 'Roboto Regular'),
        theme: ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'WorkSans',
              ),
          primaryTextTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'WorkSans',
              ),
          accentTextTheme: ThemeData.dark().textTheme.apply(
                fontFamily: 'WorkSans',
              ),
        ),
        darkTheme: ThemeData(
          fontFamily: 'WorkSans',
        ),
        initialRoute: Leaderboard.id,
        routes: {
          TestScreen.id: (context) => TestScreen(),
          Leaderboard.id: (context) => Leaderboard()
        },
      );
    });
  }
}
