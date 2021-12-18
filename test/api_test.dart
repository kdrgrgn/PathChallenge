import 'dart:convert';
import 'dart:developer';

import 'package:challenge/AppBase/app_base.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart'as http;

Future<void> main() async {
  int offset=0;
  String ts = "1";//Timestamp.fromDate(DateTime.now()).seconds.toString();
  String hash = md5.convert(utf8.encode(ts + AppBase.apiPrivateKey + AppBase.apiPublicKey)).toString();
  String query='?limit='+ "30"+ '&ts='+ ts+'&apiKey='+AppBase.apiPublicKey+'&hash='+hash+"&offset="+'$offset' ;
  print("parametrer= https://gateway.marvel.com:443/v1/public/characters$query");
  var  response=await  http.get(Uri.parse("https://gateway.marvel.com:443/v1/public/characters$query"),headers: {
    "Accept":"application/json"
  });
  log("Karakterler Cagiriliyor= "+response.body);
}
