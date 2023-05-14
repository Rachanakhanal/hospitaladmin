// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  String appointmentId;
  DateTime date;
  String status;
  String doctorName;
  String userName;
  String time;

  Appointment({
    required this.appointmentId,
    required this.date,
    required this.status,
    required this.doctorName,
    required this.userName,
    required this.time,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        appointmentId: json["appointment_id"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        doctorName: json["doctor_name"],
        userName: json["user_name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "appointment_id": appointmentId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "status": status,
        "doctor_name": doctorName,
        "user_name": userName,
        "time": time,
      };
}
