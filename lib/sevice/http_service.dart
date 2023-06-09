// import 'dart:convert';
//
// import 'package:flutter_advanced2/model/employee.dart';
// import 'package:http/http.dart';
//
// import '../model/post.dart';
//
// class Network{
//   static String BASE = "dummy.restapiexample.com";
//   static Map<String,String> headers = {
//     'Content-Type': 'application/json; charset=UTF-8'
//   };
//
//   static String API_LIST = "api/v1/employees";
//   static String API_GET_ONE = "api/v1/employee/";
//   static String API_CREATE = "/api/v1/create";
//   static String API_UPDATE = "api/v1/update/";
//   static String API_DELETE = "api/v1/delete/";
//
//   // request
//
//   static Future<String?> GET(String api, Map<String, String> params) async{
//     var uri = Uri.https(BASE,api, params);
//
//     var response = await get(uri, headers: headers);
//     if(response.statusCode == 200){
//       return response.body;
//     }
//     return null;
//   }
//
//
//   static Future<String?> POST(String api, Map<String, String> params) async{
//     var uri = Uri.https(BASE,api,params);
//
//     var response = await post(uri, headers: headers, body: jsonEncode(params));
//     print(response.body);
//     if(response.statusCode == 200 || response.statusCode == 201){
//       return response.body;
//     }
//     return null;
//   }
//
//
//   static Future<String?> PUT(String api, Map<String, String> params) async{
//     var uri = Uri.https(BASE,api);
//
//     var response = await put(uri, headers: headers, body: jsonEncode(params));
//     print(response.body);
//     if(response.statusCode == 200 || response.statusCode == 202){
//       return response.body;
//     }
//     return null;
//   }
//
//
//   static Future<String?> DEL(String api, Map<String, String> params) async{
//     var uri = Uri.https(BASE,api, params);
//
//     var response = await delete(uri, headers: headers, body: jsonEncode(params));
//     if(response.statusCode == 200){
//       return response.body;
//     }
//     return null;
//   }
//
//   static Map<String, String> paramsEmpty(){
//     Map<String,String> params = Map();
//     return params;
//   }
//
//   static Map<String, String> paramsCreate(Post post){
//     Map<String, String> params = Map();
//     params.addAll({
//       "employee_name": post.employee_name!.toString(),
//       "employee_salary": post.employee_salary!.toString(),
//       "employee_age": post.employee_age!.toString(),
//     });
//     return params;
//   }
//   //
//   //
//   static Map<String, String> paramsPut(Post post){
//     Map<String, String> params = Map();
//     params.addAll({
//       "employee_name": post.employee_name.toString(),
//       "employee_salary": post.employee_salary.toString(),
//       "employee_age": post.employee_age.toString(),
//     });
//     return params;
//   }
//
//   // Parsing data
//
//   static Employee parsePostList(String response){
//     dynamic json = jsonDecode(response);
//     var data = Employee.fromJson(json);
//     return data;
//   }
// }