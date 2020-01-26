import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/pokemonList/components/pokemonCard_widget.dart';
import 'package:flutterpokedex/app/modules/pokemonList/model/list_model.dart';
import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_bloc.dart';
import 'dart:developer' as developer;

class PokemonListPage extends StatefulWidget {
  final String title;
  const PokemonListPage({Key key, this.title = "PokemonList"})
      : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List pokeList = new List();

  @override
  void initState() {
    super.initState();
    bloc.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PokeList>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<PokeList> snapshot) {
        if (snapshot.hasData) {
//          if (snapshot.data.error != null && snapshot.data.error.length > 0){
//            return _buildErrorWidget(snapshot.data.error);
//          }
//          developer.log(snapshot.data.toString());
          return page(getList(snapshot.data), widget.title);

        }
//        else if (snapshot.hasError) {
//          return _buildErrorWidget(snapshot.error);
//        }
        else {
          return page(Text("teste"), widget.title);
        }
      },
    );
  }

  Widget page(Widget insidePage, String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Align(
        child: insidePage
      ),
    );
  }

  Widget getList(PokeList data) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        return PokemonCardWidget(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                data.list[index].id.toString() + '.png',
        data.list[index].name, data.list[index].id);
      },
      itemCount: data.list.length,
      padding: new EdgeInsets.only(top: 5.0),
    );
  }
}
