import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/pokemonList/model/list_model.dart';
import 'dart:developer' as developer;

class PokemonListApiProvider{
  final Dio _dio = Dio();

  Future<PokeList> getPokemonsList(bool isSmartdex) async {
    try {
      Response response = await _dio.get(isSmartdex? "https://1qywc1qhbh.execute-api.us-east-1.amazonaws.com/dev/getPeople":
      "https://pokeapi.co/api/v2/pokemon?limit=151");
      developer.log("response");
      return PokeList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}