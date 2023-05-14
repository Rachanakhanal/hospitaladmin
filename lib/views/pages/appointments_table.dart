import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_admin/controller/appointment_controller.dart';
import 'package:hospital_admin/controller/authentication_controller.dart';

class AppointmentsTable extends StatefulWidget {
  AppointmentsTable({super.key});

  @override
  State<AppointmentsTable> createState() => _AppointmentsTableState();
}

class _AppointmentsTableState extends State<AppointmentsTable> {
  AppointmentController appointmentController =
      Get.put(AppointmentController());
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  void initState() {
    super.initState();
    appointmentController
        .getAppointmentDetails(authenticationController.hospitalID.value);
  }

  @override
  Widget build(BuildContext context) {
    return buildBookingsDataTable();
  }

  Widget buildBookingsDataTable() {
    final columns = [
      'S.N',
      'Patient Name',
      'Date',
      'Status',
      'Doctor Name',
      'Time of Appointment'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          DataTable(
              columns: getColumns(columns),
              rows: appointmentController.appointment
                  .map((appointment) => DataRow(
                        cells: [
                          DataCell(Text(appointment.appointmentId.toString())),
                          DataCell(Text(appointment.userName)),
                          DataCell(Text(appointment.date.toString())),
                          DataCell(Text(appointment.status)),
                          DataCell(Text(appointment.doctorName)),
                          DataCell(Text(appointment.time.toString())),
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(column,
              style: const TextStyle(fontWeight: FontWeight.bold)));
    }).toList();
  }
}
