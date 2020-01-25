import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/evolution/models/evolution_models.dart';

class EvolutionService {
  final dio = Dio();

  getEvolutionsByPokemon(String id) async {
    Response evolutionResponse = await dio.get(
        "https://pokeapi.co/api/v2/evolution-chain/1")

    print("TVFEAAS" + evolutionResponse.toString());

    return evolutionResponse;
  }
}
