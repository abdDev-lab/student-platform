class EventsModel {
  int? eventsId;
  String? eventsTitle;
  String? eventsBody;
  String? eventsDate;
  int? eventsUniv;

  EventsModel(
      {this.eventsId,
      this.eventsTitle,
      this.eventsBody,
      this.eventsDate,
      this.eventsUniv});

  EventsModel.fromJson(Map<String, dynamic> json) {
    eventsId = json['events_id'];
    eventsTitle = json['events_title'];
    eventsBody = json['events_body'];
    eventsDate = json['events_date'];
    eventsUniv = json['events_univ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['events_id'] = eventsId;
    data['events_title'] = eventsTitle;
    data['events_body'] = eventsBody;
    data['events_date'] = eventsDate;
    data['events_univ'] = eventsUniv;
    return data;
  }
}