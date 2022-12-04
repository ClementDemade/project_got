import 'package:projet_got/models/main_character_data.dart';
import '../utils/api_service.dart';

class MainCharacterRepository{
  final ApiService apiService;
  MainCharacterRepository({
    required this.apiService,
  });

  Future<List<MainCharacterData>?> getAll() async {
    final response = await apiService.getPostData();
    if (response != null){
      final data = response.data as List<dynamic>;
      return data.map(
          (singleMainCharacter) => MainCharacterData.fromJson(singleMainCharacter),
      ).toList();
    }
  }

}