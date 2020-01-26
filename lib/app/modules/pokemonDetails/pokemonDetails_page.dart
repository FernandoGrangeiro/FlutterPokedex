import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/evolution/evolution_page.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemon.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statsBox/statsBox_widget.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String title;
  final int id;
  final bool shouldShowOutsmarter;
  const PokemonDetailsPage({Key key, this.title = "PokemonDetails", this.id, this.shouldShowOutsmarter})
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
    _bloc.fetchPokemonDetails(widget.id.toString(), widget.shouldShowOutsmarter);
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
                      children: !widget.shouldShowOutsmarter ? <Widget>[
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
                      ] : [],
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
                      child: !widget.shouldShowOutsmarter ? FlatButton(
                        child: Text('GO TO EVOLUTIONS'),
                        color: Colors.purple,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EvolutionPage(
                                    id: widget.id,
                                    evolutionChain: pokemon.evolutionChain,
                                  )));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white),
                        ),
                      ) : null,
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
