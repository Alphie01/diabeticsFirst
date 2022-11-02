import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:meds/screens/login/register_page.dart';
import 'package:meds/misc/functions.dart';
import 'package:meds/screens/home_screen.dart';
import 'package:meds/screens/login/login_page.dart';
import 'package:meds/screens/login/register_stepss/step_.dart' as Deneme;
import 'package:meds/screens/login/register_stepss/step_2.dart';

class registerPage extends StatelessWidget {
  String _phoneNumber = '';
  var SendedObj;
  var kullanici_mail = '';
  var Kullanici_pass = '';
  var register_step;



  registerPage({
    Key? key,
    this.register_step = 0,
  }) : super(key: key);


  var texts = [
    "Hoşgeldiniz",
    "Biraz Seni Tanıyalım!",
    "Özel Olmazsaa?",
    "Hedefiniz Ne?"
  ];

  var subTexts =[
    "Sağlıklı Yaşam Dünyasına Hazır Mısınız?",
    "Yaşamını Kolaylaşstırmak İçin Seni Biraz Tanıyalım!",
    "Sana uygun listeler oluşturmak için öğrenmemiz gereken bilgiler var.",
    "Bu uygulamada hedefiniz ne?"
  ];


  Widget pages() {
    if (register_step == 0) {

      return Deneme.registerPage1();

    } else {
      print("Mail adre ");
      return register_Step2();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 35,
            width: double.maxFinite,
            height: 35,
            child: Container(
                child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(index.toString()),
                      )
                    ],
                  ),
                );
              },
            )),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcome_regisster.jpg'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff161d27).withOpacity(1),
              Color(0xff161d27).withOpacity(0.7),
              Color(0xff161d27).withOpacity(0.7),
              Color(0xff161d27).withOpacity(1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  texts[register_step],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Text(
                      subTexts[register_step],
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                pages(),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Hesabın var mı?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FlatButton(
                      onPressed: () =>Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      )
                      ,
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
