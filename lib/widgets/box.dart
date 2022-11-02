import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meds/widgets/app_text.dart';

class genderBorder extends StatelessWidget {


  double size;
  final String text ;
  final String img ;
  final Color color;
  final Color bgcolor;
  final Color borcolor;

  genderBorder({Key? key,
    this.size = 16,
    this.img = '',
    required this.text,
    this.color = Colors.black54,this.bgcolor = Colors.black54,this.borcolor = Colors.black54}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width/4,
        height: 50,

        decoration: BoxDecoration(
          border: Border.all(color: borcolor)
        ),
        child: Container(
          color: bgcolor,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(text: text,color: color,)
            ],
          ),
        ),
      );
  }
}
