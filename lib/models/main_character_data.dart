part 'main_character_data.g.dart';

class MainCharacterData {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  MainCharacterData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
  });

  factory MainCharacterData.fromJson(Map<String, dynamic> json) =>
      _$MainCharacterDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainCharacterDataToJson(this);

  factory MainCharacterData.fromMap(Map<String, dynamic> map) {
    return MainCharacterData(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      fullName: map['fullName'] as String,
      title: map['title'] as String,
      family: map['family'] as String,
      image: map['image'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
