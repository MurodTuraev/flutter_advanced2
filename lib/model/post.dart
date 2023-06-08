
class Post {
  // int? id;
  String? employee_name;
  String? employee_salary;
  String? employee_age;

  Post(this.employee_name, this.employee_salary, this.employee_age);

  Post.fromJson(Map<dynamic, dynamic> json)
        :employee_name = json['employee_name'],
        employee_salary = json['employee_salary'].toString(),
        employee_age = json['employee_age'].toString();

  Map<String, dynamic> toJson() => {
    'employee_name': employee_name,
    'employee_salary': employee_salary,
    'employee_age': employee_age
  };
}