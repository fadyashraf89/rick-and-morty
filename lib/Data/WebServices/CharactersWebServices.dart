import 'package:dio/dio.dart';
import 'package:flutter_rickandmorty/Constants/Strings.dart';

class CharactersWebServices {
  late Dio dio; // Make dio a member variable

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options); // Create dio instance with options
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      var response = await dio.get('/character');
      print(response.data);
      return response.data['results']
          as List<dynamic>; // Return the 'results' list
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
