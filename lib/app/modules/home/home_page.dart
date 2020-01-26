import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_page.dart';
import 'package:flutterpokedex/app/modules/whoisthat/whoisthat_page.dart';
import 'package:flutterpokedex/app/modules/whoisthatoutsmarter/whoisthatoutsmarter_page.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isPokemon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image(image: AssetImage(_isPokemon ? 'lib/assets/logo.png' : 'lib/assets/equipe.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(style: BorderStyle.solid, color: Colors.yellow)),
              color: Colors.yellow,
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => PokemonListPage(isPokemon: _isPokemon,)));
              },
              child: Text(_isPokemon ? "Pokédex" : "Smartdex", style: TextStyle(color: Colors.blue)),
            ),
              FlatButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(style: BorderStyle.solid, color: Colors.blue)),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => _isPokemon ? WhoisthatPage() : WhoisthatoutsmarterPage()));
              },
              child: Text(_isPokemon ? "Who is that pokémon?" : "Who is that Outsmarter?", style: TextStyle(color: Colors.yellow))),
            ],
          ),
          IconButton(
            icon: Image(image: AssetImage('lib/assets/Red_button.png')),
            iconSize: 200,
            onPressed: () {
              setState(() {
                 _isPokemon = !_isPokemon;});
            },
          ),
        ],
      ),
    );
  }
}
