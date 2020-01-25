import 'package:flutter/material.dart';

class PokemonCardWidget extends StatelessWidget {
  var _img;
  var _title;
  var _date;
  var _description;

  PokemonCardWidget(this._img,this._title,this._date,this._description);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return new Container();
  }
}
