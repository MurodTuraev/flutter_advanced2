import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced2/sevice/rtdb_service.dart';
import 'package:flutter_advanced2/sevice/store_service.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _image;
  final picker = ImagePicker();

  _createPost(){
    String name = nameController.text.toString();
    String last_name = lastNameController.text.toString();
    String content = contentController.text.toString();
    String date = dateController.text.toString();


    if(name.isEmpty || last_name.isEmpty || content.isEmpty || date.isEmpty) return;

    _apiUploadImage(name, last_name, content, date);
  }

  _apiUploadImage(String name, String last_name, String content, String date){
    StoreService.uploadImage(_image!).then((img_url) => {
      _apiCreatePost(name, last_name, content, date, img_url)
    });
  }

  _apiCreatePost(String name, String last_name, String content, String date, String img_url){
    var post = Post(name, last_name, content, date, img_url);
    RtdbService.addPost(post).then((value) => {
      _resAddPost(),
    });
  }

  _resAddPost(){
    Navigator.of(context).pop({'data':'done'});
  }

  Future _getImage() async{
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedImage != null){
        _image = File(pickedImage.path);
      }else{
        print("No image");
      }
    });

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
                GestureDetector(
                  onTap: _getImage,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) :
                    Image.asset('assets/images/default.png'),
                  ),
                ),
                SizedBox(height: 15,),
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
