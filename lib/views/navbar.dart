import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projet_got/repository/main_character_favorite_repository.dart';
import 'package:projet_got/views/home.dart';

class navBar extends StatelessWidget{
  navBar({Key? key,required this.favorite}) : super(key:key);
  MainCharacterFavoriteRepository favorite;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Accueil'),
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage(favoris: favorite,)),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.search),
                      title: const Text('Recherche'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context,
                            '/recherche'
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite_border),
                      title: const Text('Favoris'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context,
                            '/favoris',
                        );
                      },
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

}