import 'package:flutterpokedex/app/modules/pokemonList/model/list_model.dart';
import 'package:flutterpokedex/app/modules/pokemonList/services/api_provider.dart';

class PokeListRepository{
  PokemonListApiProvider _apiProvider = PokemonListApiProvider();

  Future<PokeList> getPokemonList(bool isSmartdex){
    return _apiProvider.getPokemonsList(isSmartdex);
  }
}