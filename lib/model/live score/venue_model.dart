class VenueModel {
  int? id;
  String? name;
  String? shortName;

  VenueModel({this.id, this.name, this.shortName});

  VenueModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    return data;
  }
}
