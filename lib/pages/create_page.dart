import 'package:flutter/material.dart';
import 'package:flutter_advanced2/sevice/rtdb_service.dart';

import '../model/post.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);
  static final String id = 'create_page';

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  var contentController = TextEditingController();
  var dateController = TextEditingController();

  _createPost(){
    String name = nameController.text.toString();
    String last_name = lastNameController.text.toString();
    String content = contentController.text.toString();
    String date = dateController.text.toString();


    if(name.isEmpty || last_name.isEmpty || content.isEmpty || date.isEmpty) return;

    _apiCreatePost(name, last_name, content, date);
  }

  _apiCreatePost(String name, String last_name, String content, String date){
    var post = Post(name, last_name, content, date);
    RtdbService.addPost(post).then((value) => {
      _resAddPost(),
    });
  }

  _resAddPost(){
    Navigator.of(context).pop({'data':'done'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Firstname"
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    hintText: "Lastname"
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: "Content"
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: "Date"
                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  onPressed: (){
                    _createPost();
                  },
                  color: Colors.redAccent,
                  child: Text("Create", style: TextStyle(color: Colors.white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
