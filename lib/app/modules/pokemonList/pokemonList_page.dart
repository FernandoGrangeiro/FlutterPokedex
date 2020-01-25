import 'package:flutter/material.dart';

class PokemonListPage extends StatefulWidget {
  final String title;
  const PokemonListPage({Key key, this.title = "PokemonList"})
      : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
