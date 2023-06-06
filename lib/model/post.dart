
class Post {
  // int? id;
  String? name;
  String? salary;
  String? age;

  Post(this.name, this.salary, this.age);

  Post.fromJson(Map<String, dynamic> json)
        :name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'salary': salary,
    'age': age
  };
}