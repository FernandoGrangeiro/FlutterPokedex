class PokeList {
  List<SimplePokemon> _list;
  int _total;
  int _pageSize;

  PokeList.fromJson(Map<String, dynamic> parsedJson) {
    List<SimplePokemon> list = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      SimplePokemon result = SimplePokemon(parsedJson['results'][i]['name'],i+1);
      list.add(result);
    }
    _list = list;
    _total = parsedJson['count'];
    _pageSize = parsedJson['results'].length;
  }

  List<SimplePokemon> get list => _list;
}

class SimplePokemon {
  String _name;
  int _id;
  SimplePokemon( this._name, this._id);

  String get name => _name;
  int get id => _id;
}