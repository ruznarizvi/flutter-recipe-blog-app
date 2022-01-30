import 'package:anotherrecipeapp/databasehelper.dart';
import 'package:anotherrecipeapp/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditRecipeDetails extends StatefulWidget {
  //const EditRecipeDetails({Key? key}) : super(key: key);

  final String? recipeid;
  final String? name;
  final String? category;
  final String? preparationtime;
  final String? recipeimage;
  final List? ingredients;
  final String? rool;
  final String? email;
  final String? id;
  final String? instructions;

  //constructor
  EditRecipeDetails(
      {required this.id,
      required this.name,
      required this.category,
      required this.preparationtime,
      required this.recipeimage,
      required this.ingredients,
      required this.email,
      required this.recipeid,
      required this.rool,
      required this.instructions});

  @override
  _EditRecipeDetailsState createState() => _EditRecipeDetailsState();
}

class _EditRecipeDetailsState extends State<EditRecipeDetails> {
  final controllerName = TextEditingController();
  final controllerCategory = TextEditingController();
  final controllerPreparationtime = TextEditingController();
  final controllerInstructions = TextEditingController();

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Edit Recipe'),
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
                      "Update Recipe Details",
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
                      controller: controllerName..text = widget.name!,
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
                      controller: controllerCategory..text = widget.category!,
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
                      controller: controllerPreparationtime
                        ..text = widget.preparationtime!,
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
                      controller: controllerInstructions
                        ..text = widget.instructions!,
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
                      height: 30,
                    ),
                    MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        onPressed: () {
                          final docUser = FirebaseFirestore.instance
                              .collection('recipe')
                              .doc(widget.recipeid);
                          docUser.update({
                            'name': controllerName.text,
                            'category': controllerCategory.text,
                            'preparationtime': controllerPreparationtime.text,
                            'instructions': controllerInstructions.text,
                          });
                          print("Recipe Updated Successfully, Name: ${controllerName.text}");
                          print("Recipe Updated Successfully, Category: ${controllerCategory.text}");
                          print("Recipe Updated Successfully, Preparation Time: ${controllerPreparationtime.text}");
                          print("Recipe Updated Successfully, Instructions: ${controllerInstructions.text}");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              children: const [
                                Icon(
                                  Icons.playlist_add_check,
                                  color: Colors.greenAccent,
                                ),
                                SizedBox(width: 20),
                                Expanded(child: Text('Updated Successfully!')),
                              ],
                            ),
                          ));
                          //_db.updateRecipe(recipe, idy: "H1h5KxHQSWoNl0n30Itp");
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        color: Colors.black,
                        child: Text(
                          'Update',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
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
}
