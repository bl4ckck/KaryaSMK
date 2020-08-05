import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:karyasmk/screens/homescreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

Color _color = Color(0xFFf2f2f2);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: _color,
    ));

    return NeuApp(
      title: 'Neumorphic App',
      theme: NeuThemeData(
        platform: TargetPlatform.iOS,
        primaryColor: Color.lerp(_color, Colors.white, 0.2),
        backgroundColor: Color.lerp(_color, Colors.black, 0.005),
        scaffoldBackgroundColor: _color,
        dialogBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: _color,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
