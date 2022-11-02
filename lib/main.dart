import 'package:flutter/material.dart';
import 'package:meds/misc/functions.dart';
import 'package:meds/screens/home_screen.dart';
import 'package:meds/screens/login/login_page.dart';
import 'package:meds/screens/login/register_page.dart';
import 'package:meds/screens/main_page.dart';
import 'package:meds/screens/welcome_page.dart';
import 'package:meds/utils/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      debugShowCheckedModeBanner: false,
      //home: kullanici_info==null?LoginPage():HomeScreen(),
      home:MainPage()
      //home:registerPage(register_step: 1,)
    );
  }
}
