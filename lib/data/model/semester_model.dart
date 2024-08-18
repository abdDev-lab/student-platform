class SemesterModel {
  int? avergeId;
  int? avergeStudentId;
  int? avergeSubjectId;
  int? subjectTD;
  int? subjectTP;
  int? subjectExam;
  String? subjectName;
  int? subjectCoff;
  int? subjectCredit;
  double? subjectAverge;
  int? subjectSemester;
  int? subjectStudentCredit;
  String? subjectYear;

  SemesterModel(
      {this.avergeId,
      this.avergeStudentId,
      this.avergeSubjectId,
      this.subjectTD,
      this.subjectTP,
      this.subjectExam,
      this.subjectName,
      this.subjectCoff,
      this.subjectCredit,
      this.subjectSemester,
      this.subjectAverge,
      this.subjectStudentCredit,
      this.subjectYear});

  SemesterModel.fromJson(Map<String, dynamic> json) {
    avergeId = json['averge_id'];
    avergeStudentId = json['averge_student_id'];
    avergeSubjectId = json['averge_subject_id'];
    subjectTD = json['subject_TD'];
    subjectTP = json['subject_TP'];
    subjectExam = json['subject_exam'];
    subjectName = json['subject_name'];
    subjectCoff = json['subject_coff'];
    subjectCredit = json['subject_credit'];
    subjectSemester = json['subject_semester'];
    subjectAverge = double.parse(json['subject_averge'].toString());
    
    subjectStudentCredit = json['subject_student_credit'];
    subjectYear = json['subject_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averge_id'] = avergeId;
    data['averge_student_id'] = avergeStudentId;
    data['averge_subject_id'] = avergeSubjectId;
    data['subject_TD'] = subjectTD;
    data['subject_TP'] = subjectTP;
    data['subject_exam'] = subjectExam;
    data['subject_name'] = subjectName;
    data['subject_coff'] = subjectCoff;
    data['subject_credit'] = subjectCredit;
    data['subject_semester'] = subjectSemester;
    data['subject_averge'] = subjectAverge;
    data['subject_student_credit'] = subjectStudentCredit;
    data['subject_year'] = subjectYear;
    return data;
  }
}
