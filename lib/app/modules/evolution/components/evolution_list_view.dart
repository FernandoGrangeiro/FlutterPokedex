import 'package:flutter/cupertino.dart';
import 'package:flutterpokedex/app/modules/Evolution/components/evolution_list_cell.dart';

class EvolutionListWidget extends StatelessWidget {
  final List<String> litems = ["1", "2", "Third", "4"];

  EvolutionListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: litems.length,
        itemBuilder: (context, index) {
          return EvolutionCell(
            listEvolution: litems,
            index: index,
          );
        });
  }
}
