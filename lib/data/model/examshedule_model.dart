class ExamScheduleModel {
  int? examsheduleId;
  int? examsheduleSpecialityid;
  String? examsheduleYear;
  int? examsheduleGroupe;
  int? examsheduleSubjectid;
  String? examsheduleClasstype;
  int? examsheduleClass;
  String? examsheduleDatetimeFrom;
  String? examsheduleDatetimeTo;
  String? subjectName;

  ExamScheduleModel(
      {this.examsheduleId,
      this.examsheduleSpecialityid,
      this.examsheduleYear,
      this.examsheduleGroupe,
      this.examsheduleSubjectid,
      this.examsheduleClasstype,
      this.examsheduleClass,
      this.examsheduleDatetimeFrom,
      this.examsheduleDatetimeTo,
      this.subjectName});

  ExamScheduleModel.fromJson(Map<String, dynamic> json) {
    examsheduleId = json['examshedule_id'];
    examsheduleSpecialityid = json['examshedule_specialityid'];
    examsheduleYear = json['examshedule_year'];
    examsheduleGroupe = json['examshedule_groupe'];
    examsheduleSubjectid = json['examshedule_subjectid'];
    examsheduleClasstype = json['examshedule_classtype'];
    examsheduleClass = json['examshedule_class'];
    examsheduleDatetimeFrom = json['examshedule_datetime_from'];
    examsheduleDatetimeTo = json['examshedule_datetime_to'];
    subjectName = json['subject_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['examshedule_id'] = examsheduleId;
    data['examshedule_specialityid'] = examsheduleSpecialityid;
    data['examshedule_year'] = examsheduleYear;
    data['examshedule_groupe'] = examsheduleGroupe;
    data['examshedule_subjectid'] = examsheduleSubjectid;
    data['examshedule_classtype'] = examsheduleClasstype;
    data['examshedule_class'] = examsheduleClass;
    data['examshedule_datetime_from'] = examsheduleDatetimeFrom;
    data['examshedule_datetime_to'] = examsheduleDatetimeTo;
    data['subject_name'] = subjectName;
    return data;
  }
}