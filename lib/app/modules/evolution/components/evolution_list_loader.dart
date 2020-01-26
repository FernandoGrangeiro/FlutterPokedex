import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EvolutionListLoader extends StatelessWidget {
  EvolutionListLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      );
}
