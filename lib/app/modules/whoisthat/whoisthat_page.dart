import 'package:flutter/material.dart';

class WhoisthatPage extends StatefulWidget {
  final String title;
  const WhoisthatPage({Key key, this.title = "Whoisthat"}) : super(key: key);

  @override
  _WhoisthatPageState createState() => _WhoisthatPageState();
}

class _WhoisthatPageState extends State<WhoisthatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Image(image: AssetImage('lib/assets/whoisthat.png')),
        ],
      ),
    );
  }
}
