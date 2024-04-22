import 'package:employee_app/model/employee_model.dart';
import 'package:employee_app/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  List items = [];
  bool isLoading = false;

  void getData() async {
    String? response = await NetworkService.GET(
        NetworkService.API_GET_ALL, NetworkService.paramsEmpty());
    logger.i(response);
    print(response);
  }

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
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: Text("Get all")),
              ElevatedButton(onPressed: () {}, child: Text("Get one")),
            ],
          ),
        ));
  }
}

Widget responseItems() {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade300,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
