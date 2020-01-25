import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/evolution/evolution_bloc.dart';
import 'package:flutterpokedex/app/modules/evolution/evolution_module.dart';

import 'components/evolution_list_view.dart';

class EvolutionPage extends StatefulWidget {
  final String title;

  const EvolutionPage({Key key, this.title = "Evolution"}) : super(key: key);

  @override
  _EvolutionPageState createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  var _bloc = EvolutionBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.getEvolutionsByPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: EvolutionListWidget(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: EvolutionListWidget(),
          );
        });
  }
}
