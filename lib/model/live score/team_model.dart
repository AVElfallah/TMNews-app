class TeamModel {
  int? id;
  int? countryId;
  int? sportId;
  String? name;
  String? symbolicName;
  double? score;
  bool? isQualified;
  bool? toQualify;
  bool? isWinner;
  int? redCards;
  String? nameForURL;
  int? type;
  int? popularityRank;
  int? imageVersion;
  String? color;
  int? mainCompetitionId;
  bool? hasSquad;
  int? competitorNum;

  TeamModel(
      {this.id,
      this.countryId,
      this.sportId,
      this.name,
      this.symbolicName,
      this.score,
      this.isQualified,
      this.toQualify,
      this.isWinner,
      this.redCards,
      this.nameForURL,
      this.type,
      this.popularityRank,
      this.imageVersion,
      this.color,
      this.mainCompetitionId,
      this.hasSquad,
      this.competitorNum});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['countryId'];
    sportId = json['sportId'];
    name = json['name'];
    symbolicName = json['symbolicName'];
    score = json['score'];
    isQualified = json['isQualified'];
    toQualify = json['toQualify'];
    isWinner = json['isWinner'];
    redCards = json['redCards'];
    nameForURL = json['nameForURL'];
    type = json['type'];
    popularityRank = json['popularityRank'];
    imageVersion = json['imageVersion'];
    color = json['color'];
    mainCompetitionId = json['mainCompetitionId'];
    hasSquad = json['hasSquad'];
    competitorNum = json['competitorNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['countryId'] = countryId;
    data['sportId'] = sportId;
    data['name'] = name;
    data['symbolicName'] = symbolicName;
    data['score'] = score;
    data['isQualified'] = isQualified;
    data['toQualify'] = toQualify;
    data['isWinner'] = isWinner;
    data['redCards'] = redCards;
    data['nameForURL'] = nameForURL;
    data['type'] = type;
    data['popularityRank'] = popularityRank;
    data['imageVersion'] = imageVersion;
    data['color'] = color;
    data['mainCompetitionId'] = mainCompetitionId;
    data['hasSquad'] = hasSquad;
    data['competitorNum'] = competitorNum;
    return data;
  }
}
