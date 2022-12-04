import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_got/repository/main_character_repository.dart';
import 'package:projet_got/utils/api_service.dart';
import 'package:projet_got/views/home.dart';

import 'cubit/main_character_cubit.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCharacterCubit>(
          create: (context) => MainCharacterCubit(
            apiRepository: MainCharacterRepository(
              apiService: apiService,
            ),
          )..fetch(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        
        home: const HomePage(),
      ),
    );
  }
}