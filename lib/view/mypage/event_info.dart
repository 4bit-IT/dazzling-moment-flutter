import 'package:damo/ViewModel/bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EventInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DamoAppBar().noActionBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  Get.arguments['eventTitle'].toString(),
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Get.arguments['eventDate'].toString(),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Get.arguments['eventContent'].toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
