import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                      leading: const Icon(Icons.map),
                      title: const Text('Carte'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context,
                            '/carte'
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
                    ListTile(
                      leading: const Icon(Icons.event_note_outlined),
                      title: const Text('Rendez-vous'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context,
                            '/rendezvous',
                        );
                      },
                    ),
                  ],
                )
            ),
            const Divider(height: 2.0,),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text('Aide'),
                      onTap: () {
                        // TODO
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Paramètre'),
                      onTap: () {
                        // TODO
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Déconnexion'),
                      onTap: () {
                        // TODO
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}