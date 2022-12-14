import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/views/NavBar.dart';
import 'package:projet_got/views/main_character_current_widget.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';

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
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      Vibration.vibrate();
    });
  }

  HomePageState({required this.favoris});
  @override
  Widget build(BuildContext context) {
    loadCharacter();
    Widget customSearchBar = const Text('Game of Thrones Character');
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
                            Navigator.of(context).push(
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

  void changeTheme() async {
    if (darkmode == false) {
      AdaptiveTheme.of(context).setLight();
      setState(() {
        darkmode = true;
      });
    } else {
      AdaptiveTheme.of(context).setDark();
      setState(() {
        darkmode = false;
      });
    }
  }

  Future<Widget?> loadCharacter() async {
    if (await Permission.sensors.isLimited) {
      return AlertDialog(
        title: Text("alert"),
        content: Text("l'utilisation des capteurs est limité"),
      );
    }
    return null;
  }

  int stateFavorite(MainCharacterData character) {
    Vibration.vibrate();
    if (favoris.removeCharacter(character.fullName) < 0 ) {
      setState(() {
        favoris.addCharacter(character);
      });
      return 1;
    }
    return -1;
  }


}
