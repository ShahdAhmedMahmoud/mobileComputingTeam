import 'package:flutter/material.dart';
import 'package:student_systemv1/API/attendance_api.dart';

class AttendanceCourseHistoryScreen extends StatefulWidget {
  final int courseId;

  const AttendanceCourseHistoryScreen({super.key, required this.courseId});

  @override
  State<AttendanceCourseHistoryScreen> createState() =>
      _AttendanceCourseHistoryScreenState();
}

class _AttendanceCourseHistoryScreenState
    extends State<AttendanceCourseHistoryScreen> {
  bool loading = true;
  List data = [];
  Map summary = {};

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    try {
      final response = await AttendanceAPI.getCourseHistory(
        widget.courseId.toString(),
      );

      setState(() {
        data = response["data"] ?? [];
        summary = response["summary"] ?? {};
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        data = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Course Attendance")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : data.isEmpty
          ? const Center(child: Text("No attendance records"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, i) {
                final d = data[i] ?? {};

                return ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: d["status"] == "Present" ? Colors.green : Colors.red,
                  ),
                  title: Text(d["date"]?.toString() ?? "Unknown date"),
                  subtitle: Text("Status: ${d["status"] ?? "Unknown"}"),
                );
              },
            ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:student_systemv1/API/attendance_api.dart';

// class AttendanceCourseHistoryScreen extends StatefulWidget {
//   @override
//   _AttendanceCourseHistoryScreenState createState() =>
//       _AttendanceCourseHistoryScreenState();
// }

// class _AttendanceCourseHistoryScreenState
//     extends State<AttendanceCourseHistoryScreen> {
//   bool loading = true;
//   List data = [];
//   Map summary = {};

//   @override
//   void initState() {
//     super.initState();
//     load();
//   }

//   Future<void> load() async {
//     final courseId = Get.arguments;
//     final response = await AttendanceAPI.getCourseHistory(courseId);

//     setState(() {
//       data = response["data"];
//       summary = response["summary"];
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Course Attendance")),
//       body: loading
//           ? Center(child: CircularProgressIndicator())
//           : data.isEmpty
//           ? Center(child: Text("No attendance records"))
//           : ListView.builder(
//               padding: EdgeInsets.all(16),
//               itemCount: data.length,
//               itemBuilder: (context, i) {
//                 final d = data[i] ?? {};
//                 return ListTile(
//                   leading: Icon(
//                     Icons.check_circle,
//                     color: d["status"] == "Present" ? Colors.green : Colors.red,
//                   ),
//                   title: Text(d["date"]?.toString() ?? "Unknown date"),
//                   subtitle:
//                     Text("Status: ${d["status"] ?? "Unknown"}"),
//                 );
//               },
//             ),
//     );
//   }
// }
