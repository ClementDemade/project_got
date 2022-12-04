import 'package:flutter/material.dart';

import '../models/main_character_data.dart';
import 'NavBar.dart';

class MainCharacterCurrentWidget extends StatelessWidget {
  final MainCharacterData _mainCharacterCurrent;
  const MainCharacterCurrentWidget(
      {super.key, required MainCharacterData mainCharacterData})
      : _mainCharacterCurrent = mainCharacterData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navBar(),
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
                color: Colors.black,
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
