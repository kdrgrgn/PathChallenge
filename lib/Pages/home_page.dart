import 'package:challenge/AppBase/app_base.dart';
import 'package:challenge/Controller/marvel_controller.dart';
import 'package:challenge/Model/Characters/results.dart';
import 'package:challenge/Pages/char_details_page.dart';
import 'package:challenge/widgets/custom_progress_indicator.dart';
import 'package:challenge/widgets/home_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final MarvelController _marvelController=    Get.put(MarvelController());
 final ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() async {
      if (!_marvelController.isUpload.value &&
          _scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        if (_marvelController.isMore.value) {
          await getData();
        }
      }
    });
    _marvelController.getCharacters(0);
  }

  Future getData() async {
      _marvelController.isUpload.value = true;
      _marvelController.update();
    await  _marvelController.getCharacters(_marvelController.offset.value);
      _marvelController.isUpload.value = false;
      _marvelController.update();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          title: const Text("Characters"),
        ),
        body: GetBuilder<MarvelController>(
          init: _marvelController,
          builder: (_controller) {

            return _marvelController.loading.value?const CustomProgressIndicator():Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Flexible(
                    child: GridView.builder(
                      controller: _scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.6),
                        itemCount: _marvelController.characters.length,
                        itemBuilder: (context, index) {
                       Character char=  _marvelController.characters[index];
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CharDetailsPage(char)));

                            },
                            child: CharacterItem(
                              image: char.thumbnail!.path!+"."+char.thumbnail!.extension!,
                              name:char.name!,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                      height: _marvelController.isUpload.value ? 60.0 : 10,
                      child: _marvelController.isUpload.value ?const CustomProgressIndicator() :const SizedBox())
                ],
              ),
            );
          }
        ));
  }
}
