import 'package:challenge/Model/Characters/data.dart';

abstract class MarvelServiceBase{
  Future<CharResData?> getCharacters(int offset);
  Future getComics(int characterId);
}