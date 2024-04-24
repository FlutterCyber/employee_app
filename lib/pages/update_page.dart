import 'package:employee_app/model/employee_model.dart';
import 'package:employee_app/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UpdatePage extends StatefulWidget {
  Employee employee;

  UpdatePage({
    required this.employee,
    super.key,
  });

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "API",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Text(widget.employee.employeeName),
        ),
      ),
    );
  }
}
