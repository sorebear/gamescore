class Player {
  final int _index;
  final String _name;
  List<int> _score = [];

  Player(this._name, this._index);

  // Getters
  int get index => _index;
  String get name => _name;
  List<int> get score => _score;
  int get numOfTallys => _score.length;
  int get totalScore => _calculateTotalScore();

  // Setters
  set add(int number) => _score = _score..add(number);

  String numberAtIndex(index) {
    if (index < _score.length) {
      return _score[index].toString();
    }

    return '';
  }

  int _calculateTotalScore() {
    int _total = 0;
    _score.forEach((number) => _total += number);
    return _total;
  }
}