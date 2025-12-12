class CastModel {
  final String? name;
  final String? characterName;
  final String? urlSmallImage;
  final String? imdbCode;

  CastModel({this.name, this.characterName, this.urlSmallImage, this.imdbCode});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      characterName: json['character_name'],
      urlSmallImage: json['url_small_image'],
      imdbCode: json['imdb_code'],
    );
  }
}
