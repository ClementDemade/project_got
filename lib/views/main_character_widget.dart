import 'package:flutter/material.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/views/main_character_current_widget.dart';

class MainCharacterWidget extends StatelessWidget {
  final MainCharacterData mainCharacterData;

  const MainCharacterWidget({
    Key? key,
    required this.mainCharacterData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topCenter,
      child: MainCharacterCurrentWidget(
        mainCharacterData: mainCharacterData,
      ),
    );
  }
}
