import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projet_got/models/main_character_data.dart';
import 'package:projet_got/repository/main_character_repository.dart';

part 'main_character_state.dart';

class MainCharacterCubit extends Cubit<MainCharacterState> {
  final MainCharacterRepository apiRepository;

  MainCharacterCubit({required this.apiRepository}) : super(MainCharacter());


  Future<void> fetch() async {
    emit(MainCharacterLoading());
    try{
      final response = await apiRepository.getAll();
      emit(MainCharacterLoaded(mainCharacterData: response ?? [] ));
    } catch(e) {
      emit(MainCharacterError(message :e.toString()));
    }
  }

  @override
  void onChange(Change<MainCharacterState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
