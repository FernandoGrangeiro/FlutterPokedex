import 'package:flutter/material.dart';

class StatItemWidget extends StatelessWidget {
  const StatItemWidget({
    Key key,
    this.name,
    this.value,
  }) : super(key: key);
  final String name;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(color: Colors.black, height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VerticalDivider(color: Colors.black, ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(this.name + ' ' + this.value.toString(), style: TextStyle( color: Colors.white),),
            ),
            VerticalDivider(color: Colors.black, ),
          ],
        ),
        Container(color: Colors.black, height: 1),
      ],
    );
  }
}
