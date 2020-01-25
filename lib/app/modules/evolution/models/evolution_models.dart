class EvolutionResponse {
  final String id;
  final Chain chain;

  EvolutionResponse(this.id, this.chain);
}

class Chain {
  final List<EvolutionDetail> evolvesTo;

  Chain(this.evolvesTo);
}

class EvolutionDetail {
  final Species species;
  final List<EvolutionDetail> evolvesTo;

  EvolutionDetail(this.species, this.evolvesTo);
}

class Species {
  final String name;
  final String url;

  Species(this.name, this.url);
}
