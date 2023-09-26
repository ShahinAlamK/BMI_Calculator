import 'package:bmi/screen/welcome.dart';
import 'package:bmi/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),

        appBarTheme: AppBarTheme(
          centerTitle: true,
            backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize:getWidth(18),color: Colors.black)
        ),

        textTheme: TextTheme(
          bodyMedium: GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize:getWidth(18)),
          bodySmall: GoogleFonts.roboto(fontWeight: FontWeight.w300,fontSize:getWidth(10)),
          bodyLarge: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize:getWidth(18)),
        ),

        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade500,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            )
          )
        )
      ),
      home: Welcome()
    );
  }
}

