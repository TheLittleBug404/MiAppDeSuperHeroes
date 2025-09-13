class SuperheroDetailResponse {
  final String id;
  final String name;
  final String url;
  final String realName;
  final PowerStats powerStats;

  SuperheroDetailResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.realName,
    required this.powerStats,
  });

  factory SuperheroDetailResponse.fromJson(Map<String, dynamic> json) {
    return SuperheroDetailResponse(
      id: json["id"],
      name: json["name"],
      url: json["image"]["url"],
      realName: json["biography"]["full-name"],
      powerStats: PowerStats.fromJson(json["powerstats"])
    );
  }
}

class PowerStats {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  PowerStats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });
  factory PowerStats.fromJson(Map<String, dynamic> json) {
    return PowerStats(
      intelligence: json["intelligence"] ?? "0",
      strength: json["strength"] ?? "0",
      speed: json["speed"] ?? "0",
      durability: json["durability"] ?? "0",
      power: json["power"] ?? "0",
      combat: json["combat"] ?? "0",
    );
  }
}
