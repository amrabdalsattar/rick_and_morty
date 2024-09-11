class CharacterResponse {
  Info? info;
  List<Character>? results;

  CharacterResponse({this.info, this.results});

  CharacterResponse.fromJson(Map<String, dynamic> json) {
    info = json["info"] == null ? null : Info.fromJson(json["info"]);
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Character.fromJson(e)).toList();
  }
}

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    origin = json["origin"] == null ? null : Origin.fromJson(json["origin"]);
    location =
        json["location"] == null ? null : Location.fromJson(json["location"]);
    image = json["image"];
    episode =
        json["episode"] == null ? null : List<String>.from(json["episode"]);
    url = json["url"];
    created = json["created"];
  }
}

class Location {
  String? name;
  String? url;

  Location({this.name, this.url});

  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}

class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  Origin.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    pages = json["pages"];
    next = json["next"];
    prev = json["prev"];
  }
}
