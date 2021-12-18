import 'items.dart';

/// available : 2
/// collectionURI : "http://gateway.marvel.com/v1/public/characters/1017100/series"
/// items : [{"resourceURI":"http://gateway.marvel.com/v1/public/series/17765","name":"FREE COMIC BOOK DAY 2013 1 (2013)"},{"resourceURI":"http://gateway.marvel.com/v1/public/series/3374","name":"Hulk (2008 - 2012)"}]
/// returned : 2

class Series {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Series({
      this.available, 
      this.collectionURI, 
      this.items, 
      this.returned});

  Series.fromJson(dynamic json) {
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