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
  var shouldShowDefaultImage = true;

  @override
  void initState() {
    super.initState();
    _bloc.fetchPokemonDetails(widget.id.toString());
  }

  void toggleImageToShow() {
    setState(() {
      this.shouldShowDefaultImage = !shouldShowDefaultImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.response,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Errrrrrou'),
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
                Stack(
                  children: <Widget>[
                    Image(
                        image:
                            AssetImage('lib/assets/backgroundPokeDetail.png')),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          this.shouldShowDefaultImage ? pokemon.image : pokemon.shinyImage,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text(shouldShowDefaultImage ? 'SHOW SHINY VERSION' : 'SHOW NORMAL VERSION'),
                          color: Colors.purple,
                          textColor: Colors.white,
                          onPressed: () {
                            this.toggleImageToShow();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(color: Colors.black, height: 1),
                StatsBoxWidget(
                    stats: pokemon.stats, color: pokemon.typeInfo.color),
                new Flexible(
                  flex: 1,
                  child: Container(
                    decoration:
                        new BoxDecoration(color: pokemon.typeInfo.color),
                    child: new Center(
                      child: FlatButton(
                        child: Text('GO TO EVOLUTIONS'),
                        color: Colors.purple,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ArrozPage()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Pokemon Details'),
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
