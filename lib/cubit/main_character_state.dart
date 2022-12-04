part of 'main_character_cubit.dart';

abstract class MainCharacterState {}

class MainCharacter extends MainCharacterState {}

class MainCharacterInitial extends MainCharacterState {}

class MainCharacterLoading extends MainCharacterState {}

class MainCharacterLoaded extends MainCharacterState {
  final List<MainCharacterData> mainCharacterData;

  MainCharacterLoaded({required this.mainCharacterData});

  @override
  List<Object> get props => [mainCharacterData];
}

class MainCharacterError extends MainCharacterState {
  final String message;

  MainCharacterError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
