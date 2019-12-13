import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final String activePlayer;

  AddDialog(this.activePlayer);

  Row _renderRow(List<dynamic> buttons) {
    return Row(
      children: buttons.map((button) {
        if (button is int) {
          return RaisedButton(
            padding: EdgeInsets.all(12),
            onPressed: () {},
            child: Text(button.toString()),
          );
        }

        else return Spacer();
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(12),
      backgroundColor: Colors.teal,
      title: Text(
        this.activePlayer,
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        _renderRow([1, 2, 3]),
        _renderRow([4, 5, 6]),
        _renderRow([7, 8, 9]),
      ],
    );
  }
}
