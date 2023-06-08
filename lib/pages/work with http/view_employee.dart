import 'package:flutter/material.dart';
import 'package:flutter_advanced2/pages/work%20with%20http/network_page.dart';

class ViewEmp extends StatefulWidget {
  static final String id = 'view_emp';

  final String name;
  final int salary;
  final int age;
  ViewEmp(this.name, this.salary, this.age);

  @override
  State<ViewEmp> createState() => _ViewEmpState();
}

class _ViewEmpState extends State<ViewEmp> {
  get name => widget.name;
  get salary => widget.salary;
  get age => widget.age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Employee'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, NetworkPage.id);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$name", style: TextStyle(fontSize: 25),),
                Text("($age)", style: TextStyle(fontSize: 25),)
              ],
            ),
            SizedBox(height: 15,),
            Text("$salary'\$", style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
