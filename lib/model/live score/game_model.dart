import 'package:tell_me_news/model/live%20score/team_model.dart';
import 'package:tell_me_news/model/live%20score/venue_model.dart';

class GameModel {
  int? id;
  int? sportId;
  int? competitionId;
  int? seasonNum;
  int? stageNum;
  int? groupNum;
  String? stageName;
  String? competitionDisplayName;
  String? startTime;
  int? statusGroup;
  String? statusText;
  String? shortStatusText;
  int? gameTimeAndStatusDisplayType;
  bool? justEnded;
  double? gameTime;
  String? gameTimeDisplay;
  bool? hasMissingPlayers;
  bool? hasTVNetworks;
  bool? hasBetsTeaser;
  bool? hasLiveStreaming;
  bool? showCountdown;
  TeamModel? homeCompetitor;
  TeamModel? awayCompetitor;
  VenueModel? venue;
  bool? isHomeAwayInverted;
  bool? hasStandings;
  String? standingsName;
  bool? hasBrackets;
  bool? hasPreviousMeetings;
  bool? hasRecentMatches;
  int? winner;
  int? homeAwayTeamOrder;

  GameModel(
      {this.id,
      this.sportId,
      this.competitionId,
      this.seasonNum,
      this.stageNum,
      this.groupNum,
      this.stageName,
      this.competitionDisplayName,
      this.startTime,
      this.statusGroup,
      this.statusText,
      this.shortStatusText,
      this.gameTimeAndStatusDisplayType,
      this.justEnded,
      this.gameTime,
      this.gameTimeDisplay,
      this.hasMissingPlayers,
      this.hasTVNetworks,
      this.hasBetsTeaser,
      this.hasLiveStreaming,
      this.showCountdown,
      this.homeCompetitor,
      this.awayCompetitor,
      this.venue,
      this.isHomeAwayInverted,
      this.hasStandings,
      this.standingsName,
      this.hasBrackets,
      this.hasPreviousMeetings,
      this.hasRecentMatches,
      this.winner,
      this.homeAwayTeamOrder});

  GameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sportId = json['sportId'];
    competitionId = json['competitionId'];
    seasonNum = json['seasonNum'];
    stageNum = json['stageNum'];
    groupNum = json['groupNum'];
    stageName = json['stageName'];
    competitionDisplayName = json['competitionDisplayName'];
    startTime = json['startTime'];
    statusGroup = json['statusGroup'];
    statusText = json['statusText'];
    shortStatusText = json['shortStatusText'];
    gameTimeAndStatusDisplayType = json['gameTimeAndStatusDisplayType'];
    justEnded = json['justEnded'];
    gameTime = json['gameTime'];
    gameTimeDisplay = json['gameTimeDisplay'];
    hasMissingPlayers = json['hasMissingPlayers'];
    hasTVNetworks = json['hasTVNetworks'];
    hasBetsTeaser = json['hasBetsTeaser'];
    hasLiveStreaming = json['hasLiveStreaming'];
    showCountdown = json['showCountdown'];
    homeCompetitor = json['homeCompetitor'] != null
        ? TeamModel.fromJson(json['homeCompetitor'])
        : null;
    awayCompetitor = json['awayCompetitor'] != null
        ? TeamModel.fromJson(json['awayCompetitor'])
        : null;
    venue = json['venue'] != null ? VenueModel.fromJson(json['venue']) : null;
    isHomeAwayInverted = json['isHomeAwayInverted'];
    hasStandings = json['hasStandings'];
    standingsName = json['standingsName'];
    hasBrackets = json['hasBrackets'];
    hasPreviousMeetings = json['hasPreviousMeetings'];
    hasRecentMatches = json['hasRecentMatches'];
    winner = json['winner'];
    homeAwayTeamOrder = json['HomeAwayTeamOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sportId'] = sportId;
    data['competitionId'] = competitionId;
    data['seasonNum'] = seasonNum;
    data['stageNum'] = stageNum;
    data['groupNum'] = groupNum;
    data['stageName'] = stageName;
    data['competitionDisplayName'] = competitionDisplayName;
    data['startTime'] = startTime;
    data['statusGroup'] = statusGroup;
    data['statusText'] = statusText;
    data['shortStatusText'] = shortStatusText;
    data['gameTimeAndStatusDisplayType'] = gameTimeAndStatusDisplayType;
    data['justEnded'] = justEnded;
    data['gameTime'] = gameTime;
    data['gameTimeDisplay'] = gameTimeDisplay;
    data['hasMissingPlayers'] = hasMissingPlayers;
    data['hasTVNetworks'] = hasTVNetworks;
    data['hasBetsTeaser'] = hasBetsTeaser;
    data['hasLiveStreaming'] = hasLiveStreaming;
    data['showCountdown'] = showCountdown;
    if (homeCompetitor != null) {
      data['homeCompetitor'] = homeCompetitor!.toJson();
    }
    if (awayCompetitor != null) {
      data['awayCompetitor'] = awayCompetitor!.toJson();
    }
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    data['isHomeAwayInverted'] = isHomeAwayInverted;
    data['hasStandings'] = hasStandings;
    data['standingsName'] = standingsName;
    data['hasBrackets'] = hasBrackets;
    data['hasPreviousMeetings'] = hasPreviousMeetings;
    data['hasRecentMatches'] = hasRecentMatches;
    data['winner'] = winner;
    data['HomeAwayTeamOrder'] = homeAwayTeamOrder;
    return data;
  }
}
