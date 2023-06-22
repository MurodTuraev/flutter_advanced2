import 'package:flutter/material.dart';
import 'package:flutter_advanced2/pages/create_page.dart';
import 'package:flutter_advanced2/sevice/auth_service.dart';
import 'package:flutter_advanced2/sevice/rtdb_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  Future _callCreatePage() async{
    Map results = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return CreatePage();
    }));
    if(results != null && results.containsKey("data")){
      print(results["data"]);
      _apiPostList();
    }
  }

  _apiPostList() async{
    var list = await RtdbService.getPost();
    setState(() {
      items.clear();
      items = list;

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              AuthService.signOutUser(context);
            },
            icon: Icon(Icons.logout, weight: 30,),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index){
          return itemOfPost(items[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          _callCreatePage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget itemOfPost(Post post){
    return Slidable(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 371,
                  child: Image.network(post.img_url!, fit: BoxFit.cover,),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(post.first_name!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(width: 5,),
                    Text(post.last_name!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                  ],
                ),
                Text(post.date!, style: TextStyle(color: Colors.black38, fontSize: 20),),
                Text(post.content!, style: TextStyle(color: Colors.black38, fontSize: 20),),
              ],
            )
          ],
        ),
      ),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: (){},),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){

            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Update',
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: (){},),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){

            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
    );
  }
}
