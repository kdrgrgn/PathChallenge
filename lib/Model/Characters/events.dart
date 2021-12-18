/// available : 0
/// collectionURI : "http://gateway.marvel.com/v1/public/characters/1017100/events"
/// items : []
/// returned : 0

class Events {
  int? available;
  String? collectionURI;
  int? returned;

  Events({
      this.available, 
      this.collectionURI, 

      this.returned});

  Events.fromJson(dynamic json) {
    available = json["available"];
    collectionURI = json["collectionURI"];

    returned = json["returned"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["available"] = available;
    map["collectionURI"] = collectionURI;

    map["returned"] = returned;
    return map;
  }

}