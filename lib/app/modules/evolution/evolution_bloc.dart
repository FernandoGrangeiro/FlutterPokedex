import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutterpokedex/app/modules/evolution/models/evolution_models.dart';
import 'package:flutterpokedex/app/modules/evolution/services/evolution_service.dart';
import 'package:rxdart/rxdart.dart';

class EvolutionBloc extends BlocBase {
  final _evolutionService = EvolutionService();

  final _controller = BehaviorSubject<EvolutionResponse>();

  Stream get response => _controller.stream;

  Sink get dataEnter => _controller.sink;

  getEvolutionsByPokemon(String evolutionChain) async {

    EvolutionResponse request =
        await _evolutionService.getEvolutionsByPokemon(evolutionChain);

    dataEnter.add(request);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
