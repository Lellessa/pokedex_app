class Pokemon {

  final String name, type;
  final int id, height, weight;

  Pokemon({this.id, this.name, this.height, this.weight, this.type});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      type: json['types'][0]['type']['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }

}