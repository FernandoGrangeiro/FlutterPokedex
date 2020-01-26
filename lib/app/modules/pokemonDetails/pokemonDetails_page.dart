import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemon.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statsBox/statsBox_widget.dart';
import 'package:flutterpokedex/app/modules/arroz/arroz_page.dart';
import 'package:flutter/cupertino.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String title;
  final int id;
  const PokemonDetailsPage({Key key, this.title = "PokemonDetails", this.id})
      : super(key: key);

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  var _bloc = PokemonDetailsBloc();
  @override
  void initState() {
    super.initState();
    _bloc.fetchPokemonDetails();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.response,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Pokemon Details'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (snapshot.hasData) {
          Pokemon pokemon = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(pokemon.name),
              backgroundColor: pokemon.typeInfo.color,
            ),
            body: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(pokemon.image, height: 200, fit: BoxFit.contain,),
                  ],
                ),
                Container(color: Colors.black, height: 1),
                StatsBoxWidget(stats: pokemon.stats,),
                FlatButton(
                  child: Text('GO TO EVOLUTIONS'),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => ArrozPage()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Pokemon Details'),
              backgroundColor: Colors.red,
            ),
            body: Column(
              children: <Widget>[
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          );
        }
      },
    );
  }
}




