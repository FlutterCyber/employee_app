import 'package:employee_app/model/employee_model.dart';
import 'package:employee_app/pages/update_page.dart';
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
  List<Employee> items = [];
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();
  String? searchFieldValue;

  void getData() async {
    setState(() {
      isLoading = true;
    });

    String? response = await NetworkService.GET(
        NetworkService.API_GET_ALL, NetworkService.paramsEmpty());
    setState(() {
      items = NetworkService.parsingResponse(response: response!);
      isLoading = false;
    });
  }

  void searchById() async {
    setState(() {
      items.clear();
      isLoading = true;
    });
    String? response = await NetworkService.GET(
        NetworkService.API_GET_ONE + searchController.text.trim(),
        NetworkService.paramsEmpty());
    setState(() {
      Employee emp = NetworkService.parsingResponseOne(response: response!);
      items.add(emp);
      isLoading = false;
    });
  }

  void deleteById({required int id}) {
    getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: TextField(
                  controller: searchController,
                  onChanged: (String value) {
                    setState(() {
                      searchFieldValue = value;
                    });
                    if (searchFieldValue!.isEmpty) {
                      getData();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        searchById();
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (ctx, index) {
                          return responseItems(
                            employee: items[index],
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget responseItems({required Employee employee}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UpdatePage(employee: employee),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Id: ${employee.id}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Name: ${employee.employeeName}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Salary: ${employee.employeeSalary} \$",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Age: ${employee.employeeAge}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                deleteById(id: employee.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
