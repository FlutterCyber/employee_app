class EmpResponse {
  String status;
  List<Employee> data;
  String message;

  EmpResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  EmpResponse.fromMap(Map<String, dynamic> map)
      : status = map["status"],
        data = List<Employee>.from(map["data"].map((mp) => Employee.fromMap(mp))),
        message = map["message"];

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((mp) => mp.toMap())),
        "message": message,
      };
}

class Employee {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  Employee.fromMap(Map<String, dynamic> mp)
      : id = mp["id"],
        employeeName = mp["employee_name"],
        employeeSalary = mp["employee_salary"],
        employeeAge = mp["employee_age"],
        profileImage = mp["profile_image"];

  Map<String, dynamic> toMap() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
      };
}
