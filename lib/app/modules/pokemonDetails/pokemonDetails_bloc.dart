import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemon.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/services/pokemonDetailsService.dart';
import 'package:rxdart/rxdart.dart';

class PokemonDetailsBloc extends BlocBase {
  final _pokemonDetailService = PokemonDetailsService();
  final _controller = BehaviorSubject<Pokemon>();
  Stream get response => _controller.stream;
  Sink get dataEnter => _controller.sink;

  fetchPokemonDetails() async {
    var request = await _pokemonDetailService.getPokemonDetails("1");

    dataEnter.add(request);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
