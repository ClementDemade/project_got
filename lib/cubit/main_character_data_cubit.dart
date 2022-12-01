import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:projet_got/models/main_character_data.dart';

class MainCharacterDataCubit extends Cubit<MainCharacterData?> {
  MainCharacterDataCubit() : super(null);

  refresh() async {
    var response = await Dio().get(
      "https://www.thronesapi.com/api/v2/Characters",
    );

    MainCharacterData mainCharacterData = MainCharacterData.fromJson(response.data);

    emit(mainCharacterData);
  }
}
