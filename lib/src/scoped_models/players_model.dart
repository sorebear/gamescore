import 'package:scoped_model/scoped_model.dart';
import '../models/player.dart';

class PlayersModel extends Model {
  List<Player> _players = [
    Player('Caitlin', 0),
    Player('Soren', 1),
  ];

  List<Player> get players => _players;
  int get longestListLength => _longestListLengh();

  void add(int playerIndex, int number) {
    _players[playerIndex].add = number;
    notifyListeners();
  }

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