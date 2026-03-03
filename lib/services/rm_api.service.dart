import 'dart:io';
import 'package:app_rich_and_morty/models/character_response.model.dart';
import 'package:dio/dio.dart';

class RMApiService {
  late final Dio _dio;

  RMApiService() {
    _dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));
  }

  Future<CharacterResponse> loadCharacters({required int page}) async {
    final response = await _dio.get("/character/?page=$page");

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Erro ao buscar personagens.");
    }

    return CharacterResponse.fromMap(response.data);
  }
}
