import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/repository/main_character_repository.dart';
import 'package:projet_got/utils/api_service.dart';
import 'package:projet_got/views/favorite_widget.dart';
import 'package:projet_got/views/home.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'cubit/main_character_cubit.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(), favoris: MainCharacterFavoriteRepository(mainCharacterFavorite: {}),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.apiService,required this.favoris}) : super(key: key);
  MainCharacterFavoriteRepository favoris = MainCharacterFavoriteRepository(mainCharacterFavorite: {});
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCharacterCubit>(
          create: (context) => MainCharacterCubit(
            apiRepository: MainCharacterRepository(
              apiService: apiService,
            ),
          )..fetch(),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Dark Mode',
          theme: theme,
          darkTheme: darkTheme,
          initialRoute: '/',
          routes: <String,WidgetBuilder> {
            '/': (BuildContext context) {
              return HomePage(initialfavoris: favoris);
            },
            '/favorite': (BuildContext context) {
              return FavoritePage(initialfavoris: favoris);
            },
        }
      ),
    ),
    );
  }
}