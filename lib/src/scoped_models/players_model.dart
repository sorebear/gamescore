import 'package:scoped_model/scoped_model.dart';
import '../models/player.dart';

class PlayersModel extends Model {
  List<Player> _players = [
    Player('Caitlin'),
    Player('Soren'),
  ];

  List<Player> get players => _players;
  int get longestListLength => _longestListLengh();


  int _longestListLengh() {
    int _longestList = 0;
    _players.forEach((player) {
      if (player.numOfTallys > _longestList) {
        _longestList = player.numOfTallys;
      }
    });

    return _longestList;
  }
}