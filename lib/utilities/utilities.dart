
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'dart:convert';
import 'package:challenge/AppBase/app_base.dart';

String baseQuery() {
  String ts = DateTime.now().millisecondsSinceEpoch.toString();
  String data= ts + AppBase.apiPrivateKey + AppBase.apiPublicKey;
  var content =  const Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  String hash= hex.encode(digest.bytes);
  return '?ts='+ ts+'&apikey='+AppBase.apiPublicKey+'&hash='+hash;
}