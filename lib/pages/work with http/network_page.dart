import 'package:flutter/material.dart';
import 'package:flutter_advanced2/model/employee.dart';
import 'package:flutter_advanced2/pages/work%20with%20http/view_employee.dart';
import 'package:flutter_advanced2/sevice/http_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);
  static final String id = "network_page";

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  String? name;
  int? salary;
  int? age;
  Future _sendId(name, salary, age) async{
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context){
        return new ViewEmp(name!, salary!, age!);
      }
    ));
  }
  var isLoading = false;
  var items = [];
  Employee? employee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  int? id;
  void _apiPostDelete(id){
    Network.DEL(Network.API_DELETE+id.toString(), Network.paramsEmpty()).then((value) => {
      print(value),
    _apiPostList()
    });
  }

  void _apiPostList() async{
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response!=null){
      setState(() {
        isLoading = false;
        employee = Network.parsePostList(response);
        items=employee!.data!;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network page"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index){
              return itemHomePost(items[index]);
            },
          )
        ],
      ),
    );
  }
  Widget itemHomePost(Emp emp){
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){
              _apiPostDelete(emp.id);
            },
            flex: 3,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",

          )
        ],
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                _sendId(emp.employeeName, emp.employeeSalary, emp.employeeAge);
              },
              child: Column(
                children: [
                  Text(emp.employeeName!, style: TextStyle(color: Colors.green, fontSize: 25), ),
                  Text(emp.employeeSalary!.toString(), style: TextStyle(color: Colors.grey, fontSize: 25), ),
                ]
              ),
            )

          ],
        ),
      ),
    );
  }
}
