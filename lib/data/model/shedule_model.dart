class ScheduleModel {
  int? scheduleId;
  int? scheduleSubject;
  int? scheduleProf;
  int? scheduleGroupe;
  String? scheduleClasstype;
  int? scheduleClass;
  int? scheduleDay;
  String? scheduleFrom;
  String? scheduleTo;
  String? scheduleYear;
  int? scheduleSpeciality;
  String? teacherLastname;
  String? subjectName;
  int? specialtyId;
  int? color ; 

  ScheduleModel(
      {this.scheduleId,
      this.scheduleSubject,
      this.scheduleProf,
      this.scheduleGroupe,
      this.scheduleClasstype,
      this.scheduleClass,
      this.scheduleDay,
      this.scheduleFrom,
      this.scheduleTo,
      this.scheduleYear,
      this.scheduleSpeciality,
      this.teacherLastname,
      this.subjectName,
      this.specialtyId,
      this.color});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    scheduleSubject = json['schedule_subject'];
    scheduleProf = json['schedule_prof'];
    scheduleGroupe = json['schedule_groupe'];
    scheduleClasstype = json['schedule_classtype'];
    scheduleClass = json['schedule_class'];
    scheduleDay = json['schedule_day'];
    scheduleFrom = json['schedule_from'];
    scheduleTo = json['schedule_to'];
    scheduleYear = json['schedule_year'];
    scheduleSpeciality = json['schedule_speciality'];
    teacherLastname = json['teacher_lastname'];
    subjectName = json['subject_name'];
    specialtyId = json['specialty_id'];
    color = json["schedule_card_color"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schedule_id'] = scheduleId;
    data['schedule_subject'] = scheduleSubject;
    data['schedule_prof'] = scheduleProf;
    data['schedule_groupe'] = scheduleGroupe;
    data['schedule_classtype'] = scheduleClasstype;
    data['schedule_class'] = scheduleClass;
    data['schedule_day'] = scheduleDay;
    data['schedule_from'] = scheduleFrom;
    data['schedule_to'] = scheduleTo;
    data['schedule_year'] = scheduleYear;
    data['schedule_speciality'] = scheduleSpeciality;
    data['teacher_lastname'] = teacherLastname;
    data['subject_name'] = subjectName;
    data['specialty_id'] = specialtyId;
    return data;
  }
}