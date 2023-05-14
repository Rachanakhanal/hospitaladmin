import 'package:flutter/material.dart';
import 'package:hospital_admin/views/pages/appointments_table.dart';

import '../../components/constants.dart';
import '../../components/side_drawer.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Row(
            children: [
              const SideDrawer(),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 1000,
                      color: primaryColor,
                      child: const Center(
                        child: Text(
                          "AppointmentsPage",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            color: Color.fromARGB(255, 251, 251, 251),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AppointmentsTable(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
