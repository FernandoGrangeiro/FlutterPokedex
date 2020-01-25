import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutterpokedex/app/modules/evolution/services/evolution_service.dart';
import 'package:rxdart/rxdart.dart';

class EvolutionBloc extends BlocBase {
  final _evolutionService = EvolutionService();

  final _controller = BehaviorSubject();

  Stream get response => _controller.stream;

  Sink get dataEnter => _controller.sink;

  getEvolutionsByPokemon() async {
    var request = await _evolutionService.getEvolutionsByPokemon("1");

    dataEnter.add(request);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
