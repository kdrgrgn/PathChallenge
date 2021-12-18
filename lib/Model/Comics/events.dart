import 'items.dart';

/// available : 1
/// collectionURI : "http://gateway.marvel.com/v1/public/comics/22506/events"
/// items : [{"resourceURI":"http://gateway.marvel.com/v1/public/events/269","name":"Secret Invasion"}]
/// returned : 1

class Events {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Events({
      this.available, 
      this.collectionURI, 
      this.items, 
      this.returned});

  Events.fromJson(dynamic json) {
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