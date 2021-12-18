import 'package:challenge/AppBase/app_base.dart';
import 'package:challenge/Controller/marvel_controller.dart';
import 'package:challenge/Model/Characters/comics_items.dart';
import 'package:challenge/Model/Characters/results.dart';
import 'package:challenge/Model/Comics/results.dart';
import 'package:challenge/widgets/custom_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CharDetailsPage extends StatefulWidget {
  Character character;
   CharDetailsPage(this.character, {Key? key}) : super(key: key);

  @override
  State<CharDetailsPage> createState() => _CharDetailsPageState();
}

class _CharDetailsPageState extends State<CharDetailsPage> {
 final MarvelController _marvelController=Get.put(MarvelController());
bool isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
     await _marvelController.getComics(widget.character.id!);
setState(() {
  isLoading=false;
});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.character.name!),
      ),
      body: Column(
        children: [
          Flexible(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: widget.character.name!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),

                          child: Image.network(
                            widget.character.thumbnail!.path!+"."+widget.character.thumbnail!.extension!,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        child: Text(widget.character.description!,style:const TextStyle(fontSize: 18,color: Colors.white)),
                      ),

                      isLoading?const CustomProgressIndicator():  GetBuilder<MarvelController>(
                  builder: (snapshot) {
                    return ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.comics.length,
                        itemBuilder: (context,index){
                          Comics item=snapshot.comics[index];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 35,
                            backgroundColor: AppBase.redColor,
                            backgroundImage: Image.network(item.thumbnail!.path!+"."+item.thumbnail!.extension!).image,
                          ),
                          title: Text(item.title!,style:const TextStyle(fontSize: 18,color: Colors.white)),
                        ),
                      );
                    });
                  }
                )



                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
