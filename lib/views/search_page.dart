import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: this.controller,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        BlocProvider.of<MainCharacterCubit>(context).search(controller.text);
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body:Center(
          child: BlocBuilder<MainCharacterCubit, MainCharacterState>(
            builder: (context, state) {
              if (state is MainCharacterLoading) {
                return const CircularProgressIndicator();
              } else if (state is MainCharacterError) {
                return Text(state.message);
              } else if (state is CharacterSearchLoaded) {
                final mainCharacterList = state.mainCharacterData;
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(state.mainCharacterData.imageUrl),),
                    title: Text(state.mainCharacterData.fullName),
                    subtitle: Text(state.mainCharacterData.title),
                );
              }
              else {
                return Text("null");
              }
            },
          )
      )
    );
  }
}