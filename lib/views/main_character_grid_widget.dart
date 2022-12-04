import 'package:flutter/material.dart';

import '../models/main_character_data.dart';

class MainCharacterGridWidget extends StatelessWidget {
  final MainCharacterData _mainCharacterCurrent;
  const MainCharacterGridWidget(
  {super.key, required MainCharacterData mainCharacterData})
      : _mainCharacterCurrent = mainCharacterData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.network(
                _mainCharacterCurrent.imageUrl,
              ),
              Text(
                "firstname :${_mainCharacterCurrent.firstName}",
                //style: const TextStyle(fontSize: 32,),
              ),
              Text(
                "titles: ${_mainCharacterCurrent.title}",
              ),
            ],
          );
        },
    );

  }
}
