import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meds/misc/functions.dart';

import '../../home_screen.dart';
import '../register_page.dart';

class registerPage1 extends StatefulWidget {
  const registerPage1({Key? key}) : super(key: key);

  @override
  State<registerPage1> createState() => _registerPage1State();
}

class _registerPage1State extends State<registerPage1> {
  var SendedObj;
  static String registerMail = '';
  static String registerPass1 = '';
  static String registerPass2 = '';

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              onChanged: (news) {
                setState(() {
                  registerMail = news;
                });
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
                registerPass1 = pass;
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
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              onChanged: (pass) {
                registerPass2 = pass;
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
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: FlatButton(
              onPressed: () async {if(registerMail.length!=0){
                if(registerPass1!=registerPass2){
                  print("Farklı yazılmış");
                }else{
                  if(registerPass1.length<6){
                    print("6 karakterden az olamaz");
                  }else{
                    SendedObj = {
                      'kullanici_register': 'true',
                      'kullanici_mail': registerMail,
                      'kullanici_password': registerPass1
                    };
                    await PostData(SendedObj);

                    try{
                      if(kullanici_info[0]['kullanici_id']!=null){
                        Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => registerPage(register_step: 1,)),
                        );
                      }else{

                        // Toast mesajıı
                        print(kullanici_info[0]["Hata"]);
                      }
                    }catch(err){

                    }

                  }
                }
              }else{
                print("Email Adresiniz yanlış");
              }
                
              },
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Sonraki",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
