import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';
import '../statItem/statItem_widget.dart';

class StatsBoxWidget extends StatelessWidget {
  const StatsBoxWidget({
    Key key,
    this.stats,
  }) : super(key: key);
  final Stats stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.amberAccent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'STATS',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.25, 0.5, 0.75, 1],
              colors: [
                Colors.indigo[800],
                Colors.indigo[600],
                Colors.indigo[400],
                Colors.indigo[300],
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Flexible(
                    child: StatItemWidget(
                      name: 'Speed',
                      value: stats.speed,
                    ),
                    flex: 1,
                  ),
                  new Flexible(
                    child: StatItemWidget(
                      name: 'HP',
                      value: stats.hp,
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Flexible(
                    child: StatItemWidget(
                      name: 'Attack',
                      value: stats.attack,
                    ),
                    flex: 1,
                  ),
                  new Flexible(
                    child: StatItemWidget(
                      name: 'Special ATK',
                      value: stats.specialAttack,
                    ),
                    flex: 1,
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Flexible(
                    child: StatItemWidget(
                      name: 'Defense',
                      value: stats.defense,
                    ),
                    flex: 1,
                  ),
                  new Flexible(
                    child: StatItemWidget(
                      name: 'Special DEF',
                      value: stats.specialDefense,
                    ),
                    flex: 1,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
