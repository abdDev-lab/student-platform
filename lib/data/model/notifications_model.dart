class NotificationsModel {
  int? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  String? notificationsSmallBody;
  String? notificationsDatetime;

  NotificationsModel(
      {this.notificationsId,
      this.notificationsTitle,
      this.notificationsBody,
      this.notificationsSmallBody,
      this.notificationsDatetime});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsSmallBody = json['notifications_small_body'];
    notificationsDatetime = json['notifications_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notifications_id'] = notificationsId;
    data['notifications_title'] = notificationsTitle;
    data['notifications_body'] = notificationsBody;
    data['notifications_small_body'] = notificationsSmallBody;
    data['notifications_datetime'] = notificationsDatetime;
    return data;
  }
}
