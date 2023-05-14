import 'dart:convert';
import 'package:get/get.dart';
import 'package:hospital_admin/components/constants.dart';
import 'package:hospital_admin/controller/authentication_controller.dart';
import 'package:hospital_admin/model/appointment.dart';
import 'package:hospital_admin/utils/api.dart';
import 'package:http/http.dart' as http;

class AppointmentController extends GetxController {
  var loading = false.obs;
  var selectedDoctor = '';
  AuthenticationController authenticationController =
      AuthenticationController();
  //getting the Department details by creating model
  var appointment = <Appointment>[].obs;

  @override
  void onInit() {
    super.onInit();
    var id = authenticationController.hospitalID.value.toString();
    getAppointmentDetails(id);
  }

  //GET appointments from database
  getAppointmentDetails(id) async {
    loading.value = true;
    var url = Uri.parse(GET_APPOINTMENTS_API);
    var response = await http.post(url, body: {"id": id});
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        appointment.value = (jsonResponse["data"] as List)
            .map((e) => Appointment.fromJson(e))
            .toList();
      } else {
        // showMessage(
        //     message: jsonResponse["message"],
        //     isSuccess: false,
        //     title: 'Error'); // changed from "Success" to "Error"
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
