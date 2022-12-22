# projet_got

Pour lancer le projet l’application : flutter run --no-sound-null-safety

## Présentation :

Pour ce projet, j’ai décidé de reprendre mon projet de l’année dernière et de le faire en flutter.
Le but de cette application est d’afficher les personnages de game of thrones, d’afficher les détails d’un personnage et de pouvoir les ajouter en favoris.
Quand on lance l’application on arrive sur une liste de personnage ou il est possible d’obtenir les détails du personnage en cliquant sur la frame du personnage.
De plus, il est possible d’ajouter un personnage en favoris et d’y accéder rapidement via l’onglet favoris du menu.

C’est pourquoi, je vais vous présenter les différents points importants du projet.

## Packages :

Pour commencer, je vais présenter les différents package que j’ai utilisé dans le projet pour le réaliser :

cupertino_icons : 1.0.2
dio
bloc
flutter_bloc
intl
equatable
adaptive_theme : 1.1.0
vibration : 1.7.5
shake : 2.1.0
permission_handler : 10.2.0

Cupertino_icons pour les icons dans l’application. Dio pour récupérer les données de l’API.
bloc et flutter_bloc pour gérer les cubits et les blocs. intl permet de traduire ou de transformer du texte facilement. Equatable permet de faire de la comparaison d’objets plus facilement. Adaptive_theme pour gérer le mode sombre sur l’appli. vibration pour faire vibrer l’appareil. shake pour utiliser le gyroscope et permission_handler pour gérer l’utilisation du réseaux

## Organisation du projet :

Ensuite, pour parler de l’architecture du projet, j’ai décidé de séparer les fichiers en 5 packages.
view pour tous ce qui affichage sur l’application (donc les pages, les popups, les menus
util pour ce qui est des fonctionnalités qui vont être utilisé partout dans le projet et pour éviter la duplication de code et aussi la gestion d’élément technique utilisé par l’appli (créer la connexion avec l’api)
model pour contenir toutes les entités nécessaire à l’application.
Repository pour gérer le fonctionnement des requêtes à l’API, de traiter la donnée et de récupérer les bonnes données.
cubit pour gérer les états quand on récupère des données de l’API


## Problèmes rencontrés :

Le premier problème a été l’utilisation de plusieurs API. Dans mon projet android de l’année dernière, j’avais utilisé 3 api différentes pour obtenir plus d’informations.
Cependant, la solution que j’ai choisi a été de finalement d’en utiliser qu’une seule notamment à cause des cubits, ce qui aurait rendu beaucoup plus difficiles leurs utilisations. De plus, le fait d’utiliser 3 API différents pourrait impacter les performances de l’application.

Ensuite, un autre problème a été de rendre disponible le mode sombre pour l’application.
La solution que j’ai trouvé a été d'importer le package adaptive theme et de refactor le code déjà présent  pour utiliser le package.

Un autre problème a été d' afficher correctement les données de l’API sur un navigateur web. La solution a été de modifier ma librairie flutter en local pour modifier les permissions demandées par l’application.
Dans le même genre, il y avait aussi le problème de la connexion internet. Pour le résoudre, j’ai modifier le fichier AndroidManifest.xml

Enfin la barre de recherche, je ne l’ai pas développée car mon API ne renvoie pas un personnage en fonction du nom du personnage.

