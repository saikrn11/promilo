import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/login_provider.dart';
import 'screens/splash.dart';
import 'constants/colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROMILO',
      theme: ThemeData(
        primarySwatch: blueColor,
        primaryColorLight: lightBlue,
        primaryColorDark: greyBlue,
        scaffoldBackgroundColor: white,
        chipTheme: const ChipThemeData(
          backgroundColor: white,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          selectedColor: blue,
        ),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        dividerColor: Colors.transparent,
        primaryColor: greyBlue,
        useMaterial3: true,
      ),
      color: green,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
