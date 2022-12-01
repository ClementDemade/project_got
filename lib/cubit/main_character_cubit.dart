import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:projet_got/models/main_character_data.dart';

part 'main_character_state.dart';

class MainCharacterCubit extends Cubit<MainCharacterState> {
  MainCharacterCubit() : super(MainCharacter());

  refresh({
    imageUrl = "assets/images/stark.png"
  }) async {
    emit(MainCharacterLoading());

    await Future.delayed(const Duration(seconds: 2));


    var response = await Dio().get(
      /*parametre de l'appel*/
      "https://www.thronesapi.com/api/v2/Characters",
    );

    for (var i = 0; i < response.data.length-1; i++) {
      MainCharacterData mainCharacterData = MainCharacterData.fromJson(response.data[i]);
      print(i);
      emit(MainCharacterLoaded(mainCharacterData: mainCharacterData));
    }

  }

  @override
  void onChange(Change<MainCharacterState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
