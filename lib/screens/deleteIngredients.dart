import 'dart:convert';

import 'package:anotherrecipeapp/databasehelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';

//here we are creating the cards
class deleteIngredients extends StatelessWidget {
  //adding the ? allows the variable to be nullable
  //the title variable is for the title
  final List? ingredients;
  final String? id;

  //constructor
  deleteIngredients({this.id, this.ingredients});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper _db = DatabaseHelper();
    print(id);
    final controllers = TextEditingController();
    return SafeArea(
        child: Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Ingredients Used'),
      // ),
      body: Column(
        children: [
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFFffffe6),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Delete Ingredients",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, right: 30.0, left: 30.0),
                  child: TextField(
                    controller: controllers,
                    decoration: InputDecoration(
                      labelText: "Type what you want to delete..",
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: MaterialButton(
                minWidth: 120,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                onPressed: () {
                  //assign the typed ingredient into a list
                  var list = [controllers.text];
                  FirebaseFirestore.instance
                      .collection('recipe')
                      //pass the recipe id to know which document/record to update
                      .doc(id)
                      //update method
                      .update({
                    //delete the ingredient from the ingredients array
                    "ingredients": FieldValue.arrayRemove(list)
                  });
                  print("Ingredient Deleted Successfully, Ingredient: ${controllers.text}");
                  controllers.text = "";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      children: const [
                        Icon(
                          Icons.delete_forever_sharp,
                          color: Colors.red,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                            child: Text('Ingredient Deleted Successfully!')),
                      ],
                    ),
                  ));
                  // final user = Recipe (
                  //   //document id
                  //   //id: docUser.id,
                  //
                  //   ingredients:
                  //   [
                  //
                  //     controllers.text
                  //
                  //   ],
                  //
                  //
                  //
                  // );
                  //_db.createUser(user);
                },
                color: Colors.black,
                child: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
