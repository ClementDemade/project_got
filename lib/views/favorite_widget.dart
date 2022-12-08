import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/views/NavBar.dart';
import 'package:projet_got/views/main_character_current_widget.dart';
import 'package:projet_got/views/search_page.dart';


class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key,required this.favoris}) : super(key:key);
  MainCharacterFavoriteRepository favoris;

  @override
  Widget build(BuildContext context) {
    Icon customIcon = const Icon(Icons.search);
    Widget customSearchBar = const Text('Game of Thrones Favorite Character');
    return Scaffold(
      drawer: navBar(favorite: favoris),
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget chooseDisplay(BuildContext context) {
    if (favoris.mainCharacterFavorite.isEmpty ) {
      return const Text('No any Character');
    }
    return buildColumnCharacter(context);
  }

  Widget buildColumnCharacter(BuildContext context) {
    return Column(
      children: [
        for (var favoriteCharacter in favoris.getAll().entries)

      ],
    );
  }

  ListTile buildListTile(BuildContext context,MainCharacterData mainCharacterData){
    ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(mainCharacter.imageUrl),
      ),
      title: Text(mainCharacter.fullName),
      subtitle: Text(mainCharacter.title),
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
}
