import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meds/widgets/fitnessBox.dart';

class fitnessPage extends StatefulWidget {
  const fitnessPage({Key? key}) : super(key: key);

  @override
  State<fitnessPage> createState() => _fitnessPageState();
}

class _fitnessPageState extends State<fitnessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(35),
            child: fitnessBox(),
          )
        ],
      ),
    );
  }
}
