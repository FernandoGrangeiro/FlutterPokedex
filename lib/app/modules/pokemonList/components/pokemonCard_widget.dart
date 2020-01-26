import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_page.dart';

class PokemonCardWidget extends StatelessWidget {
  var _img;
  var _name;
  var _id;

  PokemonCardWidget(this._img,this._name, this._id);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return new Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0,bottom: 10.0,top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: clickableCard(context),
      ),
    );
  }

  Widget clickableCard(BuildContext context) {
    return new InkWell(
      onTap: () {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => PokemonDetailsPage(id: _id,)));
      },
      child: card(),
    );
  }

  Widget card() {
    return new Container(
      height: 100,
      child: new Row(
        children: <Widget>[
          new FadeInImage.assetNetwork(placeholder: 'lib/assets/whoisthat.png', image: _img,fit: BoxFit.cover),
          pokemonMainInfo()
        ],
      ),
    );
  }

  Widget pokemonMainInfo() {
    return new Container(
      margin: const EdgeInsets.only(left: 50.0, right: 10.0,bottom: 10.0,top: 10.0),
      child: new Align(
        alignment: Alignment.centerLeft,
        child: pokemonName(),
      )
    );
  }

  Widget pokemonName() {
    return new Text(
      _name,
      textAlign: TextAlign.left,
      overflow: TextOverflow.clip,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
