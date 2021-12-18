/// resourceURI : "http://gateway.marvel.com/v1/public/stories/92078"
/// name : "Hulk (2008) #55"
/// type : "cover"

class Items {
  String? resourceURI;
  String? name;
  String? type;

  Items({
      this.resourceURI, 
      this.name, 
      this.type});

  Items.fromJson(dynamic json) {
    resourceURI = json["resourceURI"];
    name = json["name"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["resourceURI"] = resourceURI;
    map["name"] = name;
    map["type"] = type;
    return map;
  }

}