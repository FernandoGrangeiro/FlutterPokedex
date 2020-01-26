import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterpokedex/app/modules/evolution/models/evolution_models.dart';

// ignore: must_be_immutable
class EvolutionCell extends StatelessWidget {
  EvolutionCell({this.listEvolution, this.index, this.id});

  final List<Species> listEvolution;
  final int index;
  final String id;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Container(
      margin: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: clickableCard(),
      ),
    );
  }

  Widget clickableCard() {
    return new InkWell(
      onTap: () {},
      child: card(),
    );
  }

  Widget card() {
    return new Container(
      height: 100,
      child: new Row(
        children: <Widget>[
          new FadeInImage.assetNetwork(
              placeholder: 'lib/assets/whoisthat.png',
              image:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                      (int.parse(id) + index + 1).toString() +
                      '.png',
              fit: BoxFit.cover),
          pokemonMainInfo()
        ],
      ),
    );
  }

  Widget pokemonMainInfo() {
    return new Container(
        margin: const EdgeInsets.only(
            left: 50.0, right: 10.0, bottom: 10.0, top: 10.0),
        child: new Align(
          alignment: Alignment.centerLeft,
          child: pokemonName(),
        ));
  }

  Widget pokemonName() {
    return new Text(
      listEvolution[index].name,
      textAlign: TextAlign.left,
      overflow: TextOverflow.clip,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
