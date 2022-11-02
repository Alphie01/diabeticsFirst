import 'package:flutter/cupertino.dart';

class fitnessBox extends StatelessWidget {
  //final Image image;
  //final String title;
  //final String value;
  //final String unit;
  //final Color color;
  //final int progress;

  fitnessBox({
    Key? key,
    //required this.image,
    //required this.title,
    //required this.value,
    //required this.unit,
    //required this.color,
    //required this.progress,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width/3;

    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Container(
            height: width/2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcome_12.jpg'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Container(
            height: width/2,
            alignment: Alignment.center,
            child: Text("dengerus"),
          )
        ],
      ),
    );
  }
}
