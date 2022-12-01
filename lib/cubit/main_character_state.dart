part of 'main_character_cubit.dart';

@immutable
abstract class MainCharacterState {}

class MainCharacter extends MainCharacterState {}

class MainCharacterLoading extends MainCharacterState {}

class MainCharacterLoaded extends MainCharacterState {
  final MainCharacterData mainCharacterData;

  MainCharacterLoaded({required this.mainCharacterData});
}
