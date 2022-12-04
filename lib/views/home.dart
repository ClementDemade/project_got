import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/views/NavBar.dart';
import 'package:projet_got/views/main_character_current_widget.dart';
import 'package:projet_got/views/search_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    Icon customIcon = const Icon(Icons.search);
    Widget customSearchBar = const Text('Game of Thrones Character');
    return Scaffold(
      drawer: navBar(),
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SearchPage())),
            icon: const Icon(Icons.search),
          )
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
                                      return MainCharacterCurrentWidget(mainCharacterData: mainCharacter);
                                  },
                                  fullscreenDialog: true,
                            ));
                          },
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

}
