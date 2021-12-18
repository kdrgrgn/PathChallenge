import 'package:challenge/Model/Characters/data.dart';
import 'package:challenge/Model/Characters/results.dart';
import 'package:challenge/Model/Comics/results.dart';
import 'package:challenge/Service/marvel_service.dart';
import 'package:challenge/Service/marvel_service_base.dart';
import 'package:get/get.dart';

class MarvelController extends GetxController implements MarvelServiceBase {
  final MarvelService _marvelService = MarvelService();

  RxList<Character> characters = <Character>[].obs;
  RxList<Comics> comics = <Comics>[].obs;
  RxInt offset = 0.obs;
  RxBool isMore = true.obs;
  RxBool loading = false.obs;
  RxBool isUpload = false.obs;

  @override
  Future<CharResData?> getCharacters(int page) async {
    try {
      if (page == 0) {
        loading = true.obs;
      }
      offset=(offset.value+1).obs;
      update();

      CharResData? res = await _marvelService.getCharacters(page);

      if (res!.results!.isEmpty) {
        isMore = false.obs;
      } else {
        characters.addAll(res.results!);
      }
      update();


      return res;
    } catch (e) {
      print("hata yakalandi $e");
      Get.showSnackbar(const GetSnackBar(message: "An error occurred, please try again",duration: Duration(seconds: 4),));

      return null;
    } finally {
      loading = false.obs;
      update();
    }
  }

  @override
  Future getComics(int characterId) async {
    try{


      comics.value= await _marvelService.getComics(characterId);
      update();
    }catch(e){
      print("hata yakalandi $e");
      Get.showSnackbar(const GetSnackBar(message: "An error occurred, please try again",duration: Duration(seconds: 4),));
    }



  }
}
