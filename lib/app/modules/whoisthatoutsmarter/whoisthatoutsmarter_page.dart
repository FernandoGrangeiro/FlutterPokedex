import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class WhoisthatoutsmarterPage extends StatefulWidget {
  final String title;
  const WhoisthatoutsmarterPage({Key key, this.title = "Who is that outsmarter?"})
      : super(key: key);

  @override
  _WhoisthatoutsmarterPageState createState() =>
      _WhoisthatoutsmarterPageState();
}

class _WhoisthatoutsmarterPageState extends State<WhoisthatoutsmarterPage> {
  AudioPlayer advancedPlayer = AudioPlayer();
  String _url = '';
  String outsmarter;
  Color _color = Color.fromRGBO(255, 255, 255, 1);
  double loadingProgress = 0.0;

  @override
  initState() {
    super.initState();
    setState(() {
      this.outsmarter = (new Random().nextInt(36) + 1).toString();
      this._url = 'https://appsimples-bucket.s3.amazonaws.com/outsmart-images/' + outsmarter + '.png';
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
    await advancedPlayer.play("https://appsimples-bucket.s3.amazonaws.com/whoisthatoutsmarter.mp3");
  }

  Future playPokemon() async {
    await advancedPlayer.play("https://appsimples-bucket.s3.amazonaws.com/outsmart-names/" + this.outsmarter + ".mp3");
    new Timer(const Duration(seconds: 2), () => setState(() async {
      await advancedPlayer.play("https://appsimples-bucket.s3.amazonaws.com/outsmart-sound/" + this.outsmarter + ".mp3");
    }));
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
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color.fromRGBO(96, 138, 198, 1),
              Color.fromRGBO(48, 73, 137, 1),
              Color.fromRGBO(41, 46, 91, 1),
            ],
          ),
        ),
        child: Center(
          child: new Stack(
            //alignment:new Alignment(x, y)
            children: <Widget>[
              Center(
                child: Image.network(this._url, height: 250, fit:BoxFit.fill, color: this._color),
              ),
              new Positioned(
                left: 50.0,
                top: 55.0,
                child: Image(image: AssetImage('lib/assets/outsmart-logo.png'), height: 130),
              ),
              new Positioned(
                left: 250.0,
                top: 40.0,
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
              // new Positioned(
              //   left: 50.0,
              //   top: 380.0,
              //   child: GestureDetector(
              //     child: Image.network(this._url, height: 250, fit:BoxFit.fill, color: this._color),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
