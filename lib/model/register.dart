
class CreateUser {
  String? fullname;
  String? email;
  String? phone;
  String? password;
  String? confpassword;

  CreateUser(this.fullname, this.email, this.phone, this.password, this.confpassword);

  CreateUser.fromJson(Map<Object, dynamic> json)
      : fullname = json['fullname'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        confpassword = json['confpassword'];

  Map<Object, dynamic> toJson() => {
    'fullname': fullname,
    'email': email,
    'phone': phone,
    'password': password,
    'confpassword': confpassword
  };
}