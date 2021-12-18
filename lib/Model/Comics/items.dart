/// resourceURI : "http://gateway.marvel.com/v1/public/events/269"
/// name : "Secret Invasion"

class Items {
  String? resourceURI;
  String? name;

  Items({
      this.resourceURI, 
      this.name});

  Items.fromJson(dynamic json) {
    resourceURI = json["resourceURI"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["resourceURI"] = resourceURI;
    map["name"] = name;
    return map;
  }

}