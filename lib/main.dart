import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMI_Calulator_App());
}

class BMI_Calulator_App extends StatelessWidget {
  const BMI_Calulator_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => InputPage(),
          '/result_page': (context) => ResultPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0C1135),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 27.0,
            ),
          ),
        ));
  }
}
