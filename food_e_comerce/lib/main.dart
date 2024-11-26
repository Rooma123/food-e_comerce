import 'package:flutter/material.dart';
import './screens/start_screen.dart';
import './screens/home_screen.dart';
import './screens/sign_inScreen.dart';
import './screens/sign_upScreen.dart';
import './screens/catigory_details_screen.dart';
import './screens/food_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.yellow, // Set secondary color to yellow
        ),
        fontFamily: 'Noto_Sans',
        textTheme: ThemeData.light().textTheme.copyWith(
              displayLarge: const TextStyle(
                fontSize: 22,
                fontFamily: 'Noto_Sans',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              bodyLarge: const TextStyle(
                fontSize: 16,
                fontFamily: 'Noto_Sans',
                color: Color.fromARGB(179, 75, 75, 75),
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontFamily: 'Noto_Sans',
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 53, 53, 53),
              ),
              titleLarge: const TextStyle(
                fontSize: 22,
                fontFamily: 'Noto_Sans',
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
              labelLarge: const TextStyle(
                fontSize: 14,
                fontFamily: 'Noto_Sans',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 156, 69, 69),
              ),
            ),
        useMaterial3: true, // This enables Material 3 features
      ),
      home: const StartScreen(),
      routes: {
        'home_screen':(context) => HomeScreen(),
        'signup':(context) => SignUpscreen(),
        'signin':(context) => SignInScreen(),
        'catigory_details':(context) => CatigoryDetails(),
        'fooddetail':(context) => FoodDetail(),
      },
    );

  }
}
