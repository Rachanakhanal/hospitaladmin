import 'dart:convert';
import 'package:get/get.dart';
import 'package:hospital_admin/components/constants.dart';
import 'package:hospital_admin/views/pages/home_page.dart';
import 'package:http/http.dart' as http;
import '../utils/api.dart';

class AuthenticationController extends GetxController {
  var hospitalID = "".obs;

  login(data) async {
    var url = Uri.parse(GET_LOGIN_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      // Converting json response into Map (list with key and its value)
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"] ?? false) {
        hospitalID.value = jsonResponse["id"].toString();
        print(hospitalID);
        Get.offAll(const HomePage());
        showMessage(
            title: "Success",
            message: jsonResponse["message"],
            isSuccess: true);
      } else {
        showMessage(
            title: "Error", message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
