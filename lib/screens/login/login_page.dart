import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:meds/screens/login/register_page.dart';
import 'package:meds/misc/functions.dart';
import 'package:meds/screens/home_screen.dart';
import 'package:meds/screens/login/register_page.dart';
import 'package:meds/screens/main_page.dart';


class LoginPage extends StatelessWidget {
  String _phoneNumber = '';
  var SendedObj;
  var kullanici_mail = '';
  var Kullanici_pass = '';


  void closeinfos(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login_d.jpg'),
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
                  "Tekrar Hoşgeldin!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(padding: EdgeInsets.only(left: 50, right:50), child: Text(

                  "Hayatını düzene koymaya devam et!",
                  style: TextStyle(color: Colors.white70, fontSize: 16, ),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 20,
                ),


                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    onChanged: (news) {
                      kullanici_mail = news;
                      print(kullanici_mail);
                    },


                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email Adresiniz",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,

                      prefixText: ' ',
                      fillColor: Color(0xff161d27).withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    onChanged: (pass) {
                      Kullanici_pass = pass;
                      print(Kullanici_pass);
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      prefixText: ' ',
                      fillColor: Color(0xff161d27).withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: FlatButton(
                    onPressed: () async {
                      if(kullanici_mail.length>6 && Kullanici_pass.length>=6){
                        SendedObj = {
                          'kullanicicek': 'true',
                          'kullanici_mail': kullanici_mail,
                          'kullanici_password': Kullanici_pass
                        };
                        print(SendedObj);
                        await PostData(SendedObj);

                        if(kullanici_info[0]['kullanici_id']!=null){
                          Navigator.pushReplacement(
                            //Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        }else{

                          // Toast mesajıı
                          print("deneme");
                        }
                      }else{
                        print("Email Adresiniz Yada Şifreniz Eksik! Lütfen Tekrar Deneyiniz!");
                      }
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "İlk Defa Mı Giriş Yapıyorsun?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => registerPage()),
                      ),
                      child: Text(
                        "Kayıt Ol",
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
