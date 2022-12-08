import 'package:flutter/material.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/views/main_character_current_widget.dart';

class MainCharacterWidget extends StatelessWidget {
  final MainCharacterData mainCharacterData;
  MainCharacterFavoriteRepository mainCharacterFavoriteRepository;

  MainCharacterWidget({
    Key? key,
    required this.mainCharacterData,
    required MainCharacterFavoriteRepository favoriteRepository,
  }) : mainCharacterFavoriteRepository = favoriteRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topCenter,
      child: MainCharacterCurrentWidget(
        mainCharacterData: mainCharacterData,
        favoriteRepository: mainCharacterFavoriteRepository,
      ),
    );
  }
}
