import 'dart:convert';
import 'dart:developer';

import 'package:challenge/Model/Characters/characters_response.dart';
import 'package:challenge/Model/Characters/data.dart';
import 'package:challenge/Model/Comics/comics_response.dart';
import 'package:challenge/Service/marvel_service_base.dart';
import 'package:challenge/utilities/utilities.dart';
import 'package:http/http.dart' as http;



class MarvelService implements MarvelServiceBase{


  String baseUrl="https://gateway.marvel.com/v1/public/";

  @override
  Future<CharResData?> getCharacters(int offset) async{


    String baseQ = baseQuery();
    String query= baseQ+ '&limit=30' + "&offset="+'$offset' ;
   var  response=await  http.get(Uri.parse(baseUrl+"characters$query"));

    var res=jsonDecode(response.body) as Map<String,dynamic>;

return CharactersResponse.fromJson(res).data!;
  }

  @override
  Future getComics(int characterId) async {
    String baseQ = baseQuery();
    DateTime dateTime =DateTime.now();
    String query= baseQ+"&dateRange=2005-01-01,${dateTime.year}-${dateTime.month}-${dateTime.day}&limit=10";
    print(baseUrl+"characters/$characterId/comics$query");
    var  response=await  http.get(Uri.parse(baseUrl+"characters/$characterId/comics$query"));
    log(response.body);

    var res=jsonDecode(response.body) as Map<String,dynamic>;

    return ComicsResponse.fromJson(res).data!.results;
  }


}