class TeacherModel {
  int? teacherId;
  String? teacherLastname;
  String? teacherFirstname;
  String? teacherEmail;
  int? teachersFaculty;
  String? teachersImage;
  int? facultyId;
  String? facultyName;
  int? facultyUniv;
  String? univName;

  TeacherModel(
      {this.teacherId,
      this.teacherLastname,
      this.teacherFirstname,
      this.teacherEmail,
      this.teachersFaculty,
      this.teachersImage,
      this.facultyId,
      this.facultyName,
      this.facultyUniv,
      this.univName});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    teacherLastname = json['teacher_lastname'];
    teacherFirstname = json['teacher_firstname'];
    teacherEmail = json['teacher_email'];
    teachersFaculty = json['teachers_faculty'];
    teachersImage = json['teachers_image'];
    facultyId = json['faculty_id'];
    facultyName = json['faculty_name'];
    facultyUniv = json['faculty_univ'];
    univName = json['univ_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['teacher_lastname'] = teacherLastname;
    data['teacher_firstname'] = teacherFirstname;
    data['teacher_email'] = teacherEmail;
    data['teachers_faculty'] = teachersFaculty;
    data['teachers_image'] = teachersImage;
    data['faculty_id'] = facultyId;
    data['faculty_name'] = facultyName;
    data['faculty_univ'] = facultyUniv;
    data['univ_name'] = univName;
    return data;
  }
}
