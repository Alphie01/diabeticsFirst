import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meds/utils/const.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive ;
  double? width;
  Page? page;
  ResponsiveButton({Key? key, this.width, this.isResponsive= false, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.circular(10),
        color: Constants.darkAccent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("img/button-one.png")
        ],
      ),
    );
  }
}
