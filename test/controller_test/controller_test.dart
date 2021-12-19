
import 'package:challenge/Controller/marvel_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  MarvelController _controller = Get.put(MarvelController());
  group('Controller Test', () {
    test('get characters', () async {
      int page = 0;
      expect(_controller.loading.value==false, true);

      await _controller.getCharacters(page);
      expect(_controller.loading.value==false, true);


      expect(_controller.characters.length == 30, true);
    });

    test('get comics', () async {
      await _controller.getComics(_controller.characters.last.id!);



      expect(_controller.comics.length<10, true);

    });
  });
}