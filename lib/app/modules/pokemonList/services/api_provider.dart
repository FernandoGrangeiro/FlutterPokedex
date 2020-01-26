import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/pokemonList/model/list_model.dart';
import 'dart:developer' as developer;

class PokemonListApiProvider{
  final String _endpoint = "https://pokeapi.co/api/v2/pokemon?limit=151";
  final Dio _dio = Dio();

  Future<PokeList> getPokemonsList() async {
    try {
      Response response = await _dio.get(_endpoint);
      developer.log("response");
//      print(response);
//      developer.log(response.toString());
      return PokeList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}