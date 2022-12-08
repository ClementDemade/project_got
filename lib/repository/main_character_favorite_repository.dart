import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';
import '../utils/api_service.dart';

class MainCharacterFavoriteRepository {
  Map<String, MainCharacterData> mainCharacterFavorite = <
      String,
      MainCharacterData>{};

  MainCharacterFavoriteRepository({
    required this.mainCharacterFavorite,
  });

  Map<String, MainCharacterData> getAll() {
    return mainCharacterFavorite;
  }

  void addCharacter(MainCharacterData character) {
    mainCharacterFavorite[character.fullName] = character;
  }

  MainCharacterData? getCharacter(String characterName) {
    for (var character in mainCharacterFavorite.keys) {
      if (characterName == character) {
        return mainCharacterFavorite[character];
      }
    }
    return null;
  }

  int removeCharacter(String characterName) {
    for (var character in mainCharacterFavorite.keys) {
      if (characterName == character) {
        mainCharacterFavorite.remove(characterName);
        return 1;
      }
    }
    return -1;
  }
}

