import 'package:flutter/material.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';

import '../models/main_character_data.dart';
import 'NavBar.dart';

class MainCharacterCurrentWidget extends StatelessWidget {
  final MainCharacterData _mainCharacterCurrent;
  MainCharacterFavoriteRepository favorite;
  MainCharacterCurrentWidget(
      {super.key, required MainCharacterData mainCharacterData, required MainCharacterFavoriteRepository favoriteRepository})
      : _mainCharacterCurrent = mainCharacterData,
  favorite = favoriteRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navBar(favorite: favorite),
      appBar: AppBar(
        title: const Text('Game of Thrones Character'),
      ),
      body: Center(
        child: Column(
          children: [
              Image.network(
                _mainCharacterCurrent.imageUrl,
              ),
            Text(
              "firstname :${_mainCharacterCurrent.firstName}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "lastname: ${_mainCharacterCurrent.lastName}",
            ),
            Text(
              "fullname: ${_mainCharacterCurrent.fullName}",
            ),
            Text(
              "titles: ${_mainCharacterCurrent.title}",
            ),
            Text(
              "family: ${_mainCharacterCurrent.family}",
            ),
          ],

        ),
      ),
    );
  }
}
