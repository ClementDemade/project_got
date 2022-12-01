import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/cubit/main_character_cubit.dart';
import 'package:projet_got/views/loading_widget.dart';

import 'main_character_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCharacterCubit(),
      child: BlocBuilder<MainCharacterCubit, MainCharacterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Main Character of Game of Thrones'),
            ),
            body: _getBody(context, state),
          );
        },
      ),
    );
  }

  Widget _getBody(BuildContext context, MainCharacterState state) {
    if (state is MainCharacterLoading) {
      return const LoadingWidget();
    } else if (state is MainCharacterLoaded) {
      return MainCharacterWidget(mainCharacterData: state.mainCharacterData);
    } else {
      return Center(
        child: ElevatedButton.icon(
          label: const Text('Fetch data'),
          icon: const Icon(Icons.refresh),
          onPressed: () => BlocProvider.of<MainCharacterCubit>(context).refresh(),
        ),
      );
    }
  }
}
