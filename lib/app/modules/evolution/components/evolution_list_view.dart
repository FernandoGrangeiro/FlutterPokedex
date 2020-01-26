import 'package:flutter/cupertino.dart';
import 'package:flutterpokedex/app/modules/Evolution/components/evolution_list_cell.dart';
import 'package:flutterpokedex/app/modules/evolution/models/evolution_models.dart';

class EvolutionListWidget extends StatelessWidget {
  final EvolutionResponse listItems;

  EvolutionListWidget({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: listItems.chain.listSpecies.length,
        itemBuilder: (context, index) {
          return EvolutionCell(
              listEvolution: listItems.chain.listSpecies,
              index: index,
              id: listItems.chain.listSpecies[0].id);
        });
  }
}
