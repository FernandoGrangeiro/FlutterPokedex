import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutterpokedex/app/modules/pokemonList/model/list_model.dart';
import 'package:flutterpokedex/app/modules/pokemonList/services/repository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonListBloc extends BlocBase {
  final PokeListRepository _repository = PokeListRepository();
  final BehaviorSubject<PokeList> _subject =
  BehaviorSubject<PokeList>();

  getPokemonList(bool isPokemon) async {
    PokeList response = await _repository.getPokemonList(isPokemon);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PokeList> get subject => _subject;
}
final bloc = PokemonListBloc();