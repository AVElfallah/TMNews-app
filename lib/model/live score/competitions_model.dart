class CompetitionsModel {
  int? id;
  int? countryId;
  int? sportId;
  String? name;
  bool? hasStandings;
  bool? hasStandingsGroups;
  bool? hasBrackets;
  String? nameForURL;
  int? totalGames;
  int? liveGames;
  int? popularityRank;
  bool? hasActiveGames;
  int? imageVersion;
  int? currentStageType;
  String? color;
  int? competitorsType;

  CompetitionsModel(
      {this.id,
      this.countryId,
      this.sportId,
      this.name,
      this.hasStandings,
      this.hasStandingsGroups,
      this.hasBrackets,
      this.nameForURL,
      this.totalGames,
      this.liveGames,
      this.popularityRank,
      this.hasActiveGames,
      this.imageVersion,
      this.currentStageType,
      this.color,
      this.competitorsType});

  CompetitionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['countryId'];
    sportId = json['sportId'];
    name = json['name'];
    hasStandings = json['hasStandings'];
    hasStandingsGroups = json['hasStandingsGroups'];
    hasBrackets = json['hasBrackets'];
    nameForURL = json['nameForURL'];
    totalGames = json['totalGames'];
    liveGames = json['liveGames'];
    popularityRank = json['popularityRank'];
    hasActiveGames = json['hasActiveGames'];
    imageVersion = json['imageVersion'];
    currentStageType = json['currentStageType'];
    color = json['color'];
    competitorsType = json['competitorsType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['countryId'] = countryId;
    data['sportId'] = sportId;
    data['name'] = name;
    data['hasStandings'] = hasStandings;
    data['hasStandingsGroups'] = hasStandingsGroups;
    data['hasBrackets'] = hasBrackets;
    data['nameForURL'] = nameForURL;
    data['totalGames'] = totalGames;
    data['liveGames'] = liveGames;
    data['popularityRank'] = popularityRank;
    data['hasActiveGames'] = hasActiveGames;
    data['imageVersion'] = imageVersion;
    data['currentStageType'] = currentStageType;
    data['color'] = color;
    data['competitorsType'] = competitorsType;
    return data;
  }
}
