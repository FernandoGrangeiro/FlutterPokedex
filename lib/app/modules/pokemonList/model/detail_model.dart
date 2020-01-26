class Pokemon {
  String name;
  List<String> types;
  String image;
  int id;

  Pokemon.fromJson(Map<String, dynamic> parsedJson) {
    List<String> listTypes = [];
    for (int i = 0; i < parsedJson['types'].length; i++) {
      String result = parsedJson['types'][i]['type']['name'];
      listTypes.add(result);
    }
    types = listTypes;
    image = parsedJson['sprites']['front_default'];
    name = parsedJson['name'];
    id = parsedJson['id'];
  }

}