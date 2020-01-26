import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class WhoisthatPage extends StatefulWidget {
  final String title;
  const WhoisthatPage({Key key, this.title = "Whoisthat"}) : super(key: key);

  @override
  _WhoisthatPageState createState() => _WhoisthatPageState();
}

class _WhoisthatPageState extends State<WhoisthatPage> {
  AudioPlayer advancedPlayer = AudioPlayer();
  String _url = '';
  String pokemon;
  Color _color = Color.fromRGBO(46, 80, 124, 1);
  double loadingProgress = 0.0;

  @override
  initState() {
    super.initState();
    setState(() {
      this.pokemon = (new Random().nextInt(36) + 1).toString();
      this._url = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' + pokemon + '.png';
    });
    loadMusic();
    progressLoading();
    new Timer(const Duration(seconds: 10), () => setState(() {
      playPokemon();
      this._color = null;
      this.loadingProgress = 0.0;
    }));
  }

  Future loadMusic() async {
    await advancedPlayer.play("https://appsimples-bucket.s3.amazonaws.com/whoisthatpokemon.mp3");
  }

  Future playPokemon() async {
    await advancedPlayer.play("https://appsimples-bucket.s3.amazonaws.com/pokemon-sound/" + this.pokemon + ".mp3");
  }

  void progressLoading() async {
    if (loadingProgress < 1) {
      new Timer(const Duration(milliseconds: 200), () => setState(() {
        this.loadingProgress += 0.021;
        progressLoading();
      }));
    }
  }
  
  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background.jpg"),
            fit: BoxFit.cover,
          ),
          // Box decoration takes a gradient
        ),
        child: Center(
          child: new Stack(
            //alignment:new Alignment(x, y)
            children: <Widget>[
              new Positioned(
                left: 20.0,
                top: 55.0,
                child: Image(image: AssetImage('lib/assets/pokemon-logo.png'), height: 130),
              ),
              new Positioned(
                left: 150.0,
                top: 200.0,
                child: Image(image: AssetImage('lib/assets/doubt.png'), height: 150),
              ),
              new Positioned(
                left: 10.0,
                top: 10.0,
                child: new CircularProgressIndicator(
                  value: this.loadingProgress,
                  strokeWidth: 6.0,
                ),
              ),
              new Positioned(
                left: 50.0,
                top: 450.0,
                child: GestureDetector(
                  child: Image.network(this._url, height: 250, fit:BoxFit.fill, color: this._color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
