import 'dart:convert';

import 'package:anotherrecipeapp/databasehelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';

//here we are creating the cards
class addIngredients extends StatelessWidget {
  //adding the ? allows the variable to be nullable
  //the title variable is for the title
  final List? name;
  final String? recipeid;

  //constructor
  addIngredients({this.recipeid, this.name});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper _db = DatabaseHelper();
    print(recipeid);
    final controllers = TextEditingController();
    return SafeArea(
        child: Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Ingredients Used'),
      // ),
      body: Column(
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
                  "Add Ingredients",
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
                      const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
                  child: TextField(
                    controller: controllers,
                    decoration: InputDecoration(
                      labelText: "New Ingredient..",
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: MaterialButton(
                minWidth: 160,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                onPressed: () {
                  //assign the typed ingredient into a list
                  var list = [controllers.text];
                  FirebaseFirestore.instance
                      .collection('recipe')
                      //pass the recipe id to know which document/record to update
                      .doc(recipeid)
                      //update method
                      .update({
                    //add the ingredient inside the ingredients array
                    "ingredients": FieldValue.arrayUnion(list)
                  });
                  print("Ingredient Added Successfully, Ingredient: ${controllers.text}");
                  controllers.text = "";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      children: const [
                        Icon(
                          Icons.playlist_add_check,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text('Ingredient Added Successfully!')),
                      ],
                    ),
                  ));
                },
                color: Colors.black,
                child: const Text(
                  '+ Add Ingredient',
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
