import 'thumbnail.dart';
import 'comics.dart';
import 'series.dart';
import 'stories.dart';
import 'events.dart';
import 'urls.dart';

/// id : 1017100
/// name : "A-Bomb (HAS)"
/// description : "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! "
/// modified : "2013-09-18T15:54:04-0400"
/// thumbnail : {"path":"http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16","extension":"jpg"}
/// resourceURI : "http://gateway.marvel.com/v1/public/characters/1017100"
/// comics : {"available":4,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/comics","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/comics/47176","name":"FREE COMIC BOOK DAY 2013 1 (2013) #1"},{"resourceURI":"http://gateway.marvel.com/v1/public/comics/40632","name":"Hulk (2008) #53"},{"resourceURI":"http://gateway.marvel.com/v1/public/comics/40630","name":"Hulk (2008) #54"},{"resourceURI":"http://gateway.marvel.com/v1/public/comics/40628","name":"Hulk (2008) #55"}],"returned":4}
/// series : {"available":2,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/series","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/series/17765","name":"FREE COMIC BOOK DAY 2013 1 (2013)"},{"resourceURI":"http://gateway.marvel.com/v1/public/series/3374","name":"Hulk (2008 - 2012)"}],"returned":2}
/// stories : {"available":7,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/stories","items":[{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92078","name":"Hulk (2008) #55","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92079","name":"Interior #92079","type":"interiorStory"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92082","name":"Hulk (2008) #54","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92083","name":"Interior #92083","type":"interiorStory"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92086","name":"Hulk (2008) #53","type":"cover"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/92087","name":"Interior #92087","type":"interiorStory"},{"resourceURI":"http://gateway.marvel.com/v1/public/stories/105929","name":"cover from Free Comic Book Day 2013 (Avengers/Hulk) (2013) #1","type":"cover"}],"returned":7}
/// events : {"available":0,"collectionURI":"http://gateway.marvel.com/v1/public/characters/1017100/events","items":[],"returned":0}
/// urls : [{"type":"detail","url":"http://marvel.com/characters/76/a-bomb?utm_campaign=apiRef&utm_source=642a174b0160eb494e54da6c4123cdc1"},{"type":"comiclink","url":"http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=642a174b0160eb494e54da6c4123cdc1"}]

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceURI;
  CharComics? comics;
  Series? series;
  Stories? stories;
  Events? events;
  List<Urls>? urls;

  Character({
      this.id, 
      this.name, 
      this.description, 
      this.modified, 
      this.thumbnail, 
      this.resourceURI, 
      this.comics, 
      this.series, 
      this.stories, 
      this.events, 
      this.urls});

  Character.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    modified = json["modified"];
    thumbnail = json["thumbnail"] != null ? Thumbnail.fromJson(json["thumbnail"]) : null;
    resourceURI = json["resourceURI"];
    comics = json["comics"] != null ? CharComics.fromJson(json["comics"]) : null;
    series = json["series"] != null ? Series.fromJson(json["series"]) : null;
    stories = json["stories"] != null ? Stories.fromJson(json["stories"]) : null;
    events = json["events"] != null ? Events.fromJson(json["events"]) : null;
    if (json["urls"] != null) {
      urls = [];
      json["urls"].forEach((v) {
        urls?.add(Urls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["description"] = description;
    map["modified"] = modified;
    if (thumbnail != null) {
      map["thumbnail"] = thumbnail?.toJson();
    }
    map["resourceURI"] = resourceURI;
    if (comics != null) {
      map["comics"] = comics?.toJson();
    }
    if (series != null) {
      map["series"] = series?.toJson();
    }
    if (stories != null) {
      map["stories"] = stories?.toJson();
    }
    if (events != null) {
      map["events"] = events?.toJson();
    }
    if (urls != null) {
      map["urls"] = urls?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}