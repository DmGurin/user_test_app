
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.results,
    required this.info,
  });

  final List<UserModel> results;
  final Info info;

  factory User.fromJson(Map<String, dynamic> json) => User(
    results: List<UserModel>.from(json["results"].map((x) => UserModel.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}

class Info {
  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  final String seed;
  final int results;
  final int page;
  final String version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: json["seed"],
    results: json["results"],
    page: json["page"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "seed": seed,
    "results": results,
    "page": page,
    "version": version,
  };
}

class UserModel {
  UserModel({
    required this.name,
    required this.location,
    required this.picture,
  });

  final Name name;
  final Location location;
  final Picture picture;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: Name.fromJson(json["name"]),
    location: Location.fromJson(json["location"]),
    picture: Picture.fromJson(json["picture"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "location": location.toJson(),
    "picture": picture.toJson(),
  };
}

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.postcode,
    required this.coordinates,
  });

  final String street;
  final String city;
  final String state;
  final String postcode;
  final Coordinates coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    street: json["street"],
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "city": city,
    "state": state,
    "postcode": postcode,
    "coordinates": coordinates.toJson(),
  };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    title: json["title"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "first": first,
    "last": last,
  };
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String large;
  final String medium;
  final String thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    large: json["large"],
    medium: json["medium"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "large": large,
    "medium": medium,
    "thumbnail": thumbnail,
  };
}
