class AttendanceCourseSummary {
  final int courseId;
  final String courseName;
  final int present;
  final int absent;
  final int totalLectures;
  final int percentage;

  AttendanceCourseSummary({
    required this.courseId,
    required this.courseName,
    required this.present,
    required this.absent,
    required this.totalLectures,
    required this.percentage,
  });

  factory AttendanceCourseSummary.fromJson(Map<String, dynamic> json) {
    int parseInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return AttendanceCourseSummary(
      courseId: parseInt(json['course_id']),
      courseName: json['course_name']?.toString() ?? '',
      present: parseInt(json['present']),
      absent: parseInt(json['absent']),
      totalLectures: parseInt(json['total_lectures']),
      percentage: parseInt(json['percentage']),
    );
  }
}

// class AttendanceCourseSummary {
//   final int courseId;
//   final String courseName;
//   final int present;
//   final int absent;
//   final int totalLectures;
//   final double percentage;

//   AttendanceCourseSummary({
//     required this.courseId,
//     required this.courseName,
//     required this.present,
//     required this.absent,
//     required this.totalLectures,
//     required this.percentage,
//   });

//   factory AttendanceCourseSummary.fromJson(Map<String, dynamic> json) {
//     return AttendanceCourseSummary(
//       courseId: json["courseId"],
//       courseName: json["courseName"],
//       present: json["present"],
//       absent: json["absent"],
//       totalLectures: json["totalLectures"],
//       percentage: double.tryParse(json["percentage"].toString()) ?? 0,
//     );
//   }
// }
