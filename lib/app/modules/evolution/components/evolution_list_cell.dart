import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EvolutionCell extends StatelessWidget {
  final List<String> listEvolution;
  final int index;

  EvolutionCell({this.listEvolution, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(listEvolution[index]),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }
}
