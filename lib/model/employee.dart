// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Employee welcomeFromJson(String str) => Employee.fromJson(json.decode(str));

String welcomeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  String? status;
  List<Emp>? data;
  String? message;

  Employee({
    required this.status,
    required this.data,
    required this.message,
  });

   Employee.fromJson(Map<String, dynamic> json) :
    status= json["status"],
    data= List<Emp>.from(json["data"].map((x) => Emp.fromJson(x))),
    message= json["message"];

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Emp {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Emp({
    required id,
    required employeeName,
    required employeeSalary,
    required employeeAge,
    required profileImage,
  });

   Emp.fromJson(Map<String, dynamic> json) :
    id= json["id"],
    employeeName= json["employee_name"],
    employeeSalary= json["employee_salary"],
    employeeAge= json["employee_age"],
    profileImage= json["profile_image"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}


class Employee1{
  String? status;
  List<Emp1>? data;
  String? message;
  Employee1({required status, required data, required message});

  Employee1.fromJson(Map<String, dynamic> json) :
      status = json['status'],
      data = List<Emp1>.from(json['data'].map((e) => Emp1.fromJson(e))),
      message = json['message'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': List<dynamic>.from(data!.map((e) => e.toJson())),
    'message': message
  };
}

class Emp1{
  String? name;
  String? salary;
  String? age;
  int? id;

  Emp1({required name, required salary, required age, required id});

  Emp1.fromJson(Map<String, dynamic> json):
      name = json['name'],
      salary = json['salary'],
      age = json['age'],
      id = json['id'];

  Map<String, dynamic> toJson() => {
    'name':name,
    'salary': salary,
    'age': age,
    'id': id
  };
}

class Employee2{
  String? status;
  List<dynamic>? data;
  String? message;
  Employee2({required status, required data, required message});

  Employee2.fromJson(Map<String, dynamic> json) :
        status = json['status'],
        data = List<Emp1>.from(json['data'].map((e) => Emp1.fromJson(e))),
        message = json['message'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': List<dynamic>.from(data!.map((e) => e.toJson())),
    'message': message
  };
}

class Employee3{
  String? status;
  String? data;
  String? message;
  Employee3({required status, required data, required message});

  Employee3.fromJson(Map<String, dynamic> json) :
        status = json['status'],
        data = json['data'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data,
    'message': message
  };
}