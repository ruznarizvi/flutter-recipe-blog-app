import 'dart:io';

import 'package:anotherrecipeapp/api/firebase_api.dart';
import 'package:anotherrecipeapp/databasehelper.dart';
import 'package:anotherrecipeapp/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class Addusers extends StatefulWidget {
  //const Addusers({Key? key}) : super(key: key);

  final String rool;
  final String email;
  final String id;

  Addusers({required this.rool, required this.email, required this.id});

  @override
  _AddusersState createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  var xx;
  UploadTask? task;
  File? file;
  final controllerName = TextEditingController();
  final controllerCategory = TextEditingController();
  final controllerPreparationtime = TextEditingController();
  final controllerInstructions = TextEditingController();

  DatabaseHelper _db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Add user'),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         _db.logout(context);
        //       },
        //       icon: Icon(Icons.logout),
        //     ),
        //   ],
        // ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFffffe6),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add a Recipe",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: <Widget>[
                    TextField(
                      controller: controllerName,
                      decoration: InputDecoration(
                        labelText: "Name",
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: controllerCategory,
                      decoration: InputDecoration(
                        labelText: "Category",
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: controllerPreparationtime,
                      decoration: InputDecoration(
                        labelText: "Preparation Time",
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: controllerInstructions,
                      decoration: InputDecoration(
                        labelText: "Instructions",
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius: new BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Wrap(
                        direction: Axis.vertical,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              fileName,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),

                        ]),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                            height: 25,
                            child: Text(
                              "select file",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            color: Colors.grey,
                            onPressed: selectFile,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                            child: Text(
                              "upload file",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            height: 25,
                            color: Colors.blueAccent,
                            onPressed: uploadFile,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 24,
                    ),
                    MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        onPressed: () {
                          final recipe = Recipe(
                            //assigning the values to the fields
                            name: controllerName.text,
                            category: controllerCategory.text,
                            preparationtime: controllerPreparationtime.text,
                            instructions: controllerInstructions.text,
                            recipeimage: xx,
                          );
                          //access createRecipe method in DatabaseHelper class
                          _db.createRecipe(recipe);
                          print("Recipe Added Successfully, Name: ${controllerName.text}");
                          print("Recipe Added Successfully, Category: ${controllerCategory.text}");
                          print("Recipe Added Successfully, Preparation Time: ${controllerPreparationtime.text}");
                          print("Recipe Added Successfully, Instructions: ${controllerInstructions.text}");
                          print("Recipe Added Successfully, Image: ${xx}");

                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              children: const [
                                Icon(
                                  Icons.playlist_add_check,
                                  color: Colors.greenAccent,
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                    child: Text('Recipe Added Successfully!')),
                              ],
                            ),
                          ));
                        },
                        color: Colors.black,
                        child: Text(
                          '+ Insert Recipe',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'recipeimages/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');

    xx = urlDownload;

    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc()
    //     .update({
    //   "recipeimage": urlDownload
    // }).then((result){
    //   print("new USer true");
    // }).catchError((onError){
    //   print("onError");
    // });
  }
}
