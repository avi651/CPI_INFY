class ISSDataModel {
  int? timestamp;
  String? message;
  IssPosition? issPosition;

  ISSDataModel({this.timestamp, this.message, this.issPosition});

  ISSDataModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    issPosition = json['iss_position'] != null
        ? new IssPosition.fromJson(json['iss_position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    if (this.issPosition != null) {
      data['iss_position'] = this.issPosition!.toJson();
    }
    return data;
  }
}

class IssPosition {
  String? longitude;
  String? latitude;

  IssPosition({this.longitude, this.latitude});

  IssPosition.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}