import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meds/misc/functions.dart';
import 'package:meds/screens/login/register_page.dart';
import 'package:meds/widgets/app_text.dart';
import 'package:meds/widgets/box.dart';

class register_Step2 extends StatefulWidget {
  const register_Step2({Key? key}) : super(key: key);

  @override
  State<register_Step2> createState() => _register_Step2State();
}

class _register_Step2State extends State<register_Step2> {
  @override
  Widget build(BuildContext context) {
    //var kullanici_id = kullanici_info[0]["kullanici_id"];
    var kullanici_id = 159;
    String registerAd = '';
    String registersoyad = '';
    String registergender= '';
    String registerDay = '25';
    String registerMonth = '08';
    String registerYear = '1999';
    var genderTyp = 0;
    Color k1 = Colors.pinkAccent;
    Color k2 = Colors.pinkAccent;
    Color e1 = Colors.lightBlue;
    Color e2 = Colors.lightBlue;
    Color e3 = Colors.transparent;
    Color k3 = Colors.transparent;

    var SendedObj;

    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              onChanged: (news) {
                print("isim = "+registerAd);

                  registerAd = news;

              },
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                hintText: "İsminiz",
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
            height: 17,
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              onChanged: (news1) {
                setState(() {
                  registersoyad = news1;
                });
              },
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                hintText: "Soy İsminiz",
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
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: "Tarih Barı gelicek",
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                  onPressed: () {
                    genderTyp = 1;
                    setState(() {
                      registergender = '1';
                      k1 = Colors.white;
                      k3 = Colors.pinkAccent;
                    });

                  },
                  child: genderBorder(
                    text: "Kadın",
                    color: k1,
                    borcolor: k2,
                    bgcolor: k3,
                  )),
              FlatButton(
                onPressed: () {
                  genderTyp = 1;
                  setState(() {
                    registergender = '2';
                    k1 = Colors.white;
                    k3 = Colors.pinkAccent;
                  });

                },
                child: genderBorder(
                  text: "Erkek",
                  color: e1,
                  borcolor: e2,
                  bgcolor: e3,
                ),
              ),
            ],
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
                if (kullanici_id == null) {
                  Navigator.pushReplacement(
                      //Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registerPage(
                                register_step: 0,
                              )));
                } else {

                  SendedObj = {
                    'kullaniciupdateRegister': 'true',
                    'kullnici_id' : kullanici_id,
                    'kullanici_adsoyad': registersoyad,
                    'kullanici_ad': registerAd,
                    'user_day': registerDay,
                    'user_month': registerMonth,
                    'user_year': registerYear,
                    'user_gender': registergender,
                  };
                  print(SendedObj);


                  if (registerAd.length < 2) {
                    print("İsminiz Yanlış");
                  } else {
                    if (registersoyad.length < 2) {
                      print("Soy Adınız Yanlış");
                    } else {
                      if (registergender.length == 0) {
                        print("Cinsiyet Seçiniz");
                      } else {

                        await PostData(SendedObj);
                        print(kullanici_info);
                      }
                    }
                  }
                }
              },
              color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Kaydol",
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
