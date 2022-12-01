import 'package:json_annotation/json_annotation.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';

part 'main_character_data.g.dart';

@JsonSerializable()
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
}
