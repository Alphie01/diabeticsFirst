import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meds/utils/const.dart';
import 'package:meds/screens/login/login_page.dart';
import 'package:meds/widgets/app_large_text.dart';
import 'package:meds/widgets/app_text.dart';
import 'package:meds/widgets/resp_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome_11.jpg", "welcome_12.jpg", "welcome_13.jpg"];
  List bigText = [
    "Sağlıklı Yaşam Noktasına\nHoş Geldiniz",
    "Spor Salonlarından\nKurtulun",
    "Yemenizden Kısmayın!"
  ];
  List medText = [
    "Zaman Kaybetme",
    "Evinizde veya sokakta spor yapın",
    "Dilediğini yiyerek kilo almaktan kurtul"
  ];
  List smlText = [
    "Sağlıklı Yaşam Noktası, sizlerin 7/24 yanınızda taşıyabileceğiniz kişisel sağlık koçunuzdur. İçerisindeki algoritmalar ile birlikte gün içerisinde yaptığınız hareketleri algılar ve onlara göre program hazırlar",
    "Sağlıklı Yaşam Noktası, sizlere uygun olarak spor progrmları oluşturur. ",
    "İster Diybetli olun, ister sadece sağlıklı yşam isteyen birileri olun bu uygulama sizlerin yaşamınız düzene sokacak!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff161d27).withOpacity(1),
                  Color(0xff161d27).withOpacity(0.8),
                  Color(0xff161d27).withOpacity(0.6),
                  Color(0xff161d27).withOpacity(0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: bigText[index],
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              child: AppText(
                                  text: medText[index],
                                  size: 26,
                                  color: Colors.white)),
                          SizedBox(height: 20),
                          Container(
                            width: MediaQuery.of(context).size.width - 50,
                            child: AppText(
                              text: smlText[index],
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          SizedBox(height: 40),
                          index == 2
                              ? FlatButton(
                                  color: Colors.white,
                                  child: Text(
                                    "İleri",
                                    style: TextStyle(color: Color(0xff161d27)),
                                  ),
                                  onPressed: () => Navigator.pushReplacement(
                                        //Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      ))
                              : Container()
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexSlide) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexSlide ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexSlide
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5)),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
