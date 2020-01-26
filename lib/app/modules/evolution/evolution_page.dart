import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/evolution/evolution_bloc.dart';

import 'components/evolution_list_loader.dart';
import 'components/evolution_list_view.dart';

class EvolutionPage extends StatefulWidget {
  final String title, evolutionChain;
  final int id;

  const EvolutionPage(
      {Key key, this.title = "Evolution", this.id, this.evolutionChain})
      : super(key: key);

  @override
  _EvolutionPageState createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  var _bloc = EvolutionBloc();

  @override
  void initState() {
    _bloc.getEvolutionsByPokemon(widget.evolutionChain.toString());
    super.initState();
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
                body: EvolutionListWidget(
                  listItems: snapshot.data
                ));
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: EvolutionListLoader());
        });
  }
}

class SnackBarPage {
  final snackBar = SnackBar(
    content: Text('Não foi possible te achar'),
  );
}
