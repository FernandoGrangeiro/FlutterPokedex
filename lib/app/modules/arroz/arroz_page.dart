import 'package:flutter/material.dart';

class ArrozPage extends StatefulWidget {
  final String title;
  const ArrozPage({Key key, this.title = "Arroz"}) : super(key: key);

  @override
  _ArrozPageState createState() => _ArrozPageState();
}

class _ArrozPageState extends State<ArrozPage> {
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
