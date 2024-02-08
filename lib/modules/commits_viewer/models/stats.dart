import 'dart:convert';

class Stats {
  int additions;
  int deletions;
  int total;

  Stats({
    required this.additions,
    required this.deletions,
    required this.total,
  });

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        additions: json["additions"],
        deletions: json["deletions"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "additions": additions,
        "deletions": deletions,
        "total": total,
      };
}
