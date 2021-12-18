import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterItem extends StatelessWidget {

  String name;
  String image;
   CharacterItem({required this.name,required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),

        boxShadow:const [
          BoxShadow(
              color: Colors.red,
              offset: Offset(0, 3),
              blurRadius: 5)
        ],
      ),
      child: Column(
        children: [
          Expanded(flex: 4,
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(10)),
              child: Hero(
                tag: name,
                child: Image.network(
                 image,
                  fit: BoxFit.cover,
                  width: Get.width/2,
                  height: 230,
                ),
              ),
            ),
          )
          ,
          Expanded(
            flex: 1,
            child:  Padding(
              padding:const  EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Text(
                name,
                style:const TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
