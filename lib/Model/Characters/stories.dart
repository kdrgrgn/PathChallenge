import 'items.dart';

/// available : 7
/// collectionURI : "http://gateway.marvel.com/v1/public/characters/1017100/stories"
/// items : [{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92078","name":"Hulk (2008) #55","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92079","name":"Interior #92079","type":"interiorStory"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92082","name":"Hulk (2008) #54","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92083","name":"Interior #92083","type":"interiorStory"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92086","name":"Hulk (2008) #53","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92087","name":"Interior #92087","type":"interiorStory"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/105929","name":"cover from Free Comic Book Day 2013 (Avengers/Hulk) (2013) #1","type":"cover"}]
/// returned : 7

class Stories {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Stories({
      this.available, 
      this.collectionURI, 
      this.items, 
      this.returned});

  Stories.fromJson(dynamic json) {
    available = json["available"];
    collectionURI = json["collectionURI"];
    if (json["items"] != null) {
      items = [];
      json["items"].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    returned = json["returned"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["available"] = available;
    map["collectionURI"] = collectionURI;
    if (items != null) {
      map["items"] = items?.map((v) => v.toJson()).toList();
    }
    map["returned"] = returned;
    return map;
  }

}