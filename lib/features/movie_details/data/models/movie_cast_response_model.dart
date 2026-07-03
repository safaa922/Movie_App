
class MovieCreditsResponseModel{
  final List<CastModel>?cast;
  MovieCreditsResponseModel({required this.cast});

  factory MovieCreditsResponseModel.fromJson(Map<String,dynamic>json){
    return MovieCreditsResponseModel(
      cast:(json["cast"]as List).map((e)=>CastModel.fromJson(e)).toList()
    );
  }
}

class CastModel {
  final int id;
  final String name;
  final String character;
  final String? profilePath;

  CastModel({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'],
    );
  }
}