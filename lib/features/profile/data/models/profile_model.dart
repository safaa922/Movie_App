

class ProfileModel{
  final String name;
  final String email;
  final String imageUrl;
  ProfileModel({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String,dynamic>json){
    return ProfileModel(
        name: json['Name'] ?? '',
        email: json['Email'] ?? '',
        imageUrl: json['ImageUrl'] ?? ''
    );
  }

}