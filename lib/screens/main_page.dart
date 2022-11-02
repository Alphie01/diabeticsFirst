import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meds/screens/fitness.dart';
import 'package:meds/screens/home_screen.dart';


// anasayfa yol tarifi arama sipariş
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomeScreen(),
    fitnessPage()

  ];
  int currIndex = 0;

  void onTap(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: "BAr"),
          BottomNavigationBarItem(
            label: "Add",
            icon: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor, shape: BoxShape.circle),
                padding: EdgeInsets.all(14),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Arama"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
