import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/views/NavBar.dart';
import 'package:projet_got/views/main_character_current_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.initialfavoris}) : super(key: key);
  MainCharacterFavoriteRepository initialfavoris;


  @override
  HomePageState createState() => new HomePageState(favoris: initialfavoris);
}

class HomePageState extends State<HomePage> {
  MainCharacterFavoriteRepository favoris;
  bool darkmode = false;
  dynamic savedThemeMode;

  void initState() {
    super.initState();
    getCurrentTheme();
  }


  HomePageState({required this.favoris});
  @override
  Widget build(BuildContext context) {
    Widget customSearchBar = const Text('Game of Thrones Character');
    SwitchListTile switchButton =
      SwitchListTile(
        title: Text('Mode sombre'),
        activeColor: Colors.orange,
        secondary: const Icon(Icons.nightlight_round),
        value: darkmode,
        onChanged: (bool value) {
          print(value);
          if (value == true) {
            AdaptiveTheme.of(context).setDark();
          } else {
            AdaptiveTheme.of(context).setLight();
          }
          setState(() {
            darkmode = value;
          });
        },
      );
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
        child: BlocBuilder<MainCharacterCubit, MainCharacterState>(
          builder: (context, state) {
            if (state is MainCharacterLoading) {
              return const CircularProgressIndicator();
            } else if (state is MainCharacterError) {
              return Text(state.message);
            } else if (state is MainCharacterLoaded) {
              final mainCharacterList = state.mainCharacterData;
              return mainCharacterList.isEmpty
                  ? const Text('No any Character')
                  : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: mainCharacterList.length,
                    itemBuilder: (context, index) {
                      print(index);
                      final MainCharacterData mainCharacter = mainCharacterList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(mainCharacter.imageUrl),
                          ),
                          title: Text(mainCharacter.fullName),
                          subtitle: Text(mainCharacter.title),
                          onTap: () {
                            Navigator.of(context).pop(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return MainCharacterCurrentWidget(mainCharacterData: mainCharacter, favoriteRepository: favoris);
                                  },
                                  fullscreenDialog: true,
                            ));
                          },
                          trailing: IconButton(
                            onPressed: () => stateFavorite(mainCharacter),
                            icon: favoris.getCharacter(mainCharacter.fullName)!= null
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),

                          ),
                      );
                      }
                      );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      print('thème sombre');
      setState(() {
        darkmode = true;
      });
    } else {
      print('thème clair');
      setState(() {
        darkmode = false;
      });
    }
  }

  void changeTheme() async {
    if (darkmode == true) {
      AdaptiveTheme.of(context).setDark();
      setState(() {
        darkmode = false;
      });
    } else {
      AdaptiveTheme.of(context).setLight();
      setState(() {
        darkmode = true;
      });
    }
  }

  int stateFavorite(MainCharacterData character) {
    if (this.favoris.removeCharacter(character.fullName) < 0 ) {
      setState(() {
        favoris.addCharacter(character);
      });
      return 1;
    }
    return -1;
  }


}
