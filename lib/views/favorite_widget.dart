import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/views/NavBar.dart';
import 'package:projet_got/views/main_character_current_widget.dart';
import 'package:vibration/vibration.dart';


class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key, required this.initialfavoris}) : super(key: key);
  MainCharacterFavoriteRepository initialfavoris;

  @override
  FavoritePageState createState() => FavoritePageState(favoris: initialfavoris);
}

class FavoritePageState extends State<FavoritePage> {
  MainCharacterFavoriteRepository favoris;

  FavoritePageState({required this.favoris});
  @override
  Widget build(BuildContext context) {
    Icon customIcon = const Icon(Icons.search);
    Widget customSearchBar = const Text('Game of Thrones Favorite Character');
    return Scaffold(
      drawer: navBar(favorite: favoris),
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          ElevatedButton(
            onPressed: () {
              changeTheme();
            },
            child: Text('Changer le thème'),
          ),
        ],
      ),
      body: Center(
        child: chooseDisplay(context),
        ),
      );
  }

  Widget chooseDisplay(BuildContext context) {
    if (favoris.mainCharacterFavorite.isEmpty ) {
      return const Text('No any Character');
    }
    return buildColumnCharacter( context);
  }

  Widget buildColumnCharacter(BuildContext context) {
    return Column(
      children: [
        for (var favoriteCharacter in favoris.getAll().entries)
          buildListTile(context, favoris.getCharacter(favoriteCharacter.key))
      ],
    );
  }

  ListTile buildListTile(BuildContext context,MainCharacterData? mainCharacterData){
    if (mainCharacterData.toString() == null){
      return ListTile(leading: Text("null"));
    }
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(mainCharacterData!.imageUrl),
      ),
      title: Text(mainCharacterData.fullName),
      subtitle: Text(mainCharacterData.title),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return MainCharacterCurrentWidget(mainCharacterData: mainCharacterData, favoriteRepository: favoris);
              },
              fullscreenDialog: true,
            ));
      },
      trailing: IconButton(
        onPressed: () => stateFavorite(mainCharacterData),
        icon: favoris.getCharacter(mainCharacterData.fullName)!= null
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
      ),
    );
  }

  int stateFavorite(MainCharacterData character) {
    Vibration.vibrate();
    if (favoris.getCharacter(character.fullName) == null ) {
      setState(() {
        favoris.addCharacter(character);
      });
      return 1;
    }
    else if (favoris.getCharacter(character.fullName) != null){
      setState(() {
        favoris.removeCharacter(character.fullName);
      });
      return -1;
    }

    return -1;
  }

  void changeTheme() async {
    if (AdaptiveTheme.of(context).isDefault){
      AdaptiveTheme.of(context).setDark();
    } else {
      AdaptiveTheme.of(context).setLight();
    }
  }

}
