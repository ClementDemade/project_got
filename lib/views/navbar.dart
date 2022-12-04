import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projet_got/views/home.dart';

class navBar extends StatelessWidget{
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
                        MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context,
                            '/profile',
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