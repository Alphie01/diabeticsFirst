import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

final url = "http://api.sehirkilavuzu.com/islem.php";


var _postData = [];
var _PostedData = [];
var SendedObj;
var kullanici_mail = '';
var Kullanici_pass = '';

var kullanici_info;


void fetchPost(String pageUrl) async {
  try {
    final getUserUrl = url + pageUrl;
    final respon = await get(Uri.parse(getUserUrl));
    final json_vl = jsonDecode(respon.body) as List;
  } catch (err) {}
}

void writeDataGet() async {
  try {
    final writenDataUrl = url +
        "?writeData=true&kullanici_mail=denememaildir22@gmail.com&kullanici_password=denemep31231assword";
    final respon = await get(Uri.parse(writenDataUrl));

    print(respon.body);
  } catch (err) {}
}



PostData(Object obj) async {
  try {
    var response = await post(Uri.parse(url), body: obj);
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    kullanici_info = await jsonDecode(response.body);
    /*Navigator.pushReplacement(
      //Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    )*/
  } catch (err) {
    print(err);
  }
}