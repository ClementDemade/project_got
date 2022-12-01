import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/cubit/main_character_data_cubit.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/views/main_character_widget.dart';

class HomeData extends StatelessWidget {
  const HomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCharacterDataCubit(),
      child: BlocBuilder<MainCharacterDataCubit, MainCharacterData?>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('MainCharacterData Bloc'),
            ),
            body: _getBody(context, state),
          );
        },
      ),
    );
  }

  Widget _getBody(BuildContext context, MainCharacterData? mainCharacterData) {
    if (mainCharacterData == null) {
      /**
      return Center(
        child: ElevatedButton.icon(
          label: const Text('Fetch data'),
          icon: const Icon(Icons.refresh),
          onPressed: () => BlocProvider.of<MainCharacterDataCubit>(context).refresh(),
        ),
      );

          **/
      return Center(
        child: ElevatedButton.icon(
          label: const Text('Fetch data'),
          icon: const Icon(Icons.refresh),
          onPressed: () => _getBody(context, mainCharacterData),
        ),
      );
    } else {
      return MainCharacterWidget(mainCharacterData: mainCharacterData);
    }
  }
}
