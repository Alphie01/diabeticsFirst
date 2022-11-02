import 'package:flutter/cupertino.dart';
import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:meds/misc/functions.dart';
import 'package:meds/utils/const.dart';
import 'package:meds/widgets/card_items.dart';
import 'package:meds/widgets/card_main.dart';
import 'package:meds/widgets/card_section.dart';
import 'package:meds/widgets/custom_clipper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Theme.of(context).accentColor,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),
          Positioned(
              right: -45,
              top: -30,
              child: ClipOval(
                  child: Container(
                    color: Colors.black.withOpacity(0.05),
                    height: 220,
                    width: 220,
                  ),
              ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Günaydın,\n${kullanici_info[0]['kullanici_adsoyad']}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.white
                          ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 26.0,
                      backgroundImage: AssetImage('assets/icons/profile_picture.png')
                    )
                  ],
                ),

                SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                Container(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardMain(
                            image: AssetImage('assets/icons/heartbeat.png'),
                            title: "Ort. Kalp Atışı",
                            value: "66",
                            unit: "bpm",
                            color: Constants.lightGreen,
                        ),
                        CardMain(
                            image: AssetImage('assets/icons/blooddrop.png'),
                            title: "Yakılan Ort Kalori",
                            value: "125",
                            unit: "Kalori",
                            color: Constants.lightYellow
                        )
                      ],
                    ),
                ),

                // Section Cards - Daily Medication

                SizedBox(height: 50),

                Text("Ilaçlarını Almayı Unutma",
                  style: TextStyle(
                    color: Constants.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                Container(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardSection(
                          image: AssetImage('assets/icons/capsule.png'),
                          title: "Vitamin",
                          value: "2",
                          unit: "pills",
                          time: "6-7AM",
                          isDone: false,
                        ),
                        CardSection(
                          image: AssetImage('assets/icons/syringe.png'),
                          title: "Insülin",
                          value: "12",
                          unit: "Doz",
                          time: "Sabah",
                          isDone: true,
                        )
                      ],
                    )),

                SizedBox(height: 50),

                // Scheduled Activities
                Text("Bu Gün Hedefin",
                  style: TextStyle(
                      color: Constants.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(

                        image: Image.asset(
                          'assets/icons/Walking.png',
                        ),
                        title: "Yürüyüs",
                        value: "7500",
                        unit: "Adım",
                        color: Constants.lightYellow,
                        progress: 30,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/Swimming.png',
                        ),
                        title: "Yüzme",
                        value: "30",
                        unit: "Dakika",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),
                    ],
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}
