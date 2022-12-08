import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      String url = "https://www.thronesapi.com/api/v2/Characters";
      var response = await Dio().get(
        /*parametre de l'appel*/
        "https://www.thronesapi.com/api/v2/Characters",
      );
      return response;
    } on SocketException {
      throw Exception();
    } catch (err) {
      print("error" + err.toString());
    }
  }


}