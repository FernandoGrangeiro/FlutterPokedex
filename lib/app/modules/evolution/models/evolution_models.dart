class EvolutionResponse {
  final String id;
  final Chain chain;

  EvolutionResponse({this.id, this.chain});

  factory EvolutionResponse.fromJson(Map<String, dynamic> json) {
    return EvolutionResponse(
        id: json['id'].toString(), chain: Chain.fromJson(json['chain']));
  }
}

class Chain {
  final List<Species> listSpecies;

  Chain({this.listSpecies});

  factory Chain.fromJson(Map<String, dynamic> json) {
    List<Species> list = [];
    list.add(Species.fromJson(json['species']));
    list.add(Species.fromJson(json['evolves_to'][0]['species']));
    list.add(
        Species.fromJson(json['evolves_to'][0]['evolves_to'][0]['species']));

    return Chain(listSpecies: list);
  }
}

class Species {
  final String name;
  final String id;

  Species({this.name, this.id});

  factory Species.fromJson(Map<String, dynamic> json) {
    var id = json['url'];
    var index = id.lastIndexOf('/');

    return Species(name: json['name'], id: id[index - 1]);
  }
}
