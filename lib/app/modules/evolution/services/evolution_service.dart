import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/evolution/models/evolution_models.dart';

class EvolutionService {
  final dio = Dio();

  Future<EvolutionResponse> getEvolutionsByPokemon(String id) async {
    Response evolutionResponse =
        await dio.get("https://pokeapi.co/api/v2/evolution-chain/1");

    return _parseEvolutions(evolutionResponse.toString());
  }

  EvolutionResponse _parseEvolutions(String responseBody) {
    final parsed = json.decode(responseBody);

    return EvolutionResponse.fromJson(parsed);
  }
}
