import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/players_model.dart';
import '../models/player.dart';

class AddDialog extends StatefulWidget {
  final Player activePlayer;

  AddDialog(this.activePlayer);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  String _activeNumber = '';

  Function _buttonAction(dynamic button, PlayersModel model) {
    if (button is int) {
      return () => setState(() => _activeNumber += button.toString());
    } else if (button == Icon(Icons.clear)) {
      return () => setState(() => _activeNumber = '');
    } else {
      return () {};
    }
  }
  
  Row _renderRow(List<dynamic> buttons, PlayersModel model) {
    return Row(
      children: buttons.map((button) {
        return RaisedButton(
          padding: EdgeInsets.all(12),
          onPressed: _buttonAction(button, model),
          child: (button is int) ? Text(button.toString()) : button,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PlayersModel>(
      builder: (BuildContext context, child, PlayersModel model) {
      return SimpleDialog(
        contentPadding: EdgeInsets.all(12),
        backgroundColor: Colors.teal,
        title: Text(
          this.widget.activePlayer.name,
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          Text(
            _activeNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          _renderRow([1, 2, 3], model),
          _renderRow([4, 5, 6], model),
          _renderRow([7, 8, 9], model),
          _renderRow([Icon(Icons.backspace), 0, Icon(Icons.clear)], model),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              model.add(this.widget.activePlayer.index, int.parse(_activeNumber));
            } 
          )
        ],
      );
    });
  }
}
