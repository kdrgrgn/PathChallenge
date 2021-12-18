/// type : "detail"
/// url : "http://marvel.com/characters/76/a-bomb?utm_campaign=apiRef&utm_source=642a174b0160eb494e54da6c4123cdc1"

class Urls {
  String? type;
  String? url;

  Urls({
      this.type, 
      this.url});

  Urls.fromJson(dynamic json) {
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = type;
    map["url"] = url;
    return map;
  }

}