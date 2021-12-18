import 'items.dart';

/// available : 2
/// collectionURI : "http://gateway.marvel.com/v1/public/comics/22506/stories"
/// items : [{"resourceURI":"http://gateway.marvel.com/v1/public/stories/49888","name":"AVENGERS: THE INITIATIVE (2007) #19","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/49889","name":"Avengers: The Initiative (2007) #19 - Int","type":"interiorStory"}]
/// returned : 2

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