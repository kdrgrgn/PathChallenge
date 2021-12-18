import 'comics_items.dart';

class CharComics {
  int? available;
  String? collectionURI;
  List<ComicsItem>? items;
  int? returned;

  CharComics({this.available, this.collectionURI, this.items, this.returned});

  CharComics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json["items"] != null) {
      items = [];
      json["items"].forEach((v) {
        items?.add(ComicsItem.fromJson(v));
      });
    }

    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['available'] = available;
    map['collectionURI'] = collectionURI;
    if (items != null) {
      map["items"] = items?.map((v) => v.toJson()).toList();
    }
    map['returned'] = returned;
    return map;
  }
}