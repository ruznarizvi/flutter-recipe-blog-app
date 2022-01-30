import 'package:anotherrecipeapp/databasehelper.dart';
import 'package:anotherrecipeapp/models/recipe.dart';
import 'package:anotherrecipeapp/screens/addingredients.dart';
import 'package:anotherrecipeapp/screens/loginpage.dart';
import 'package:anotherrecipeapp/screens/viewrecipedetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'addrecipes.dart';

class viewFavourites extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  viewFavourites({required this.rool, required this.email, required this.id});

  //const viewFavourites({Key? key}) : super(key: key);

  @override
  _viewFavouritesState createState() => _viewFavouritesState();
}

class _viewFavouritesState extends State<viewFavourites> {
  List items = [];
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  String categoryvalue = "";

  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          // appBar: AppBar(
          //   backgroundColor: Colors.purple,
          //   title: Text('List all users'),
          //   actions: [
          //     IconButton(
          //       onPressed: () {
          //         _db.logout(context);
          //         Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          //           builder: (_) => LoginPage(),
          //         ),
          //         );
          //       },
          //       icon: Icon(Icons.logout),
          //     ),
          //   ],
          // ),
          body: Container(
        color: Colors.white,
        child: Column(children: [
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
                  "Favourites",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),

          Flexible(
            child: StreamBuilder<List<Recipe>>(
              //calling the readFavouriteDetails method in the DatabaseHelper Class
              //passing the user id
                stream: _db.readFavouriteDetails(widget.id),
                initialData: [],
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  //check if we have data
                  if (snapshot.hasData) {
                    //accessing data
                    final recipiex = snapshot.data!;
                    return ListView(
                      children: recipiex.map(buildUser).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),

          const SizedBox(
            height: 24,
          ),

          // (widget.rool == 'Admin')
          // ?ElevatedButton(onPressed: (){
          //   Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => Addusers()));
          //
          //
          //
          // }, child: Text('Add recipe')):Container(),
        ]),
      )),
    );
  }

  //get one specific user and display in listtile
  Widget buildUser(Recipe recipe) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    // TaskCardWidget(id: user.id, name: user.ingredients,)
                    ViewRecipeDetails(
                      id: widget.id,
                      rool: widget.rool,
                      email: widget.email,
                      name: recipe.name,
                      recipeid: recipe.id,
                      ingredients: recipe.ingredients,
                      category: recipe.category,
                      recipeimage: recipe.recipeimage,
                      instructions: recipe.instructions,
                      preparationtime: recipe.preparationtime,
                      favourites: recipe.favourites,
                    )));
          },
          child: Container(
            height: 200.0,

            //decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.purple)),

            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: NetworkImage('${recipe.recipeimage}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 140.0,
                      width: double.infinity,

                      // child:  Image.network(
                      //
                      //     '${user.recipeimage}'),

                      // leading: CircleAvatar(child: Image.network(
                      //     '${user.recipeimage}'),),
                      // title: Text('${user.category}'),
                      // subtitle: Text('${user.preparationtime}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: IconButton(
                            icon: new Icon(Icons.highlight_remove),
                            highlightColor: Colors.pink,
                            color: Colors.red,
                            onPressed: () {
                              //assign the user id into a list
                              var list = [widget.id];
                              FirebaseFirestore.instance
                                  .collection('recipe')
                                  //pass the recipe id to know which document/record to update
                                  .doc(recipe.id)
                                  //update method
                                  .update({
                                //remove the user id which is inside the favourites array
                                "favourites": FieldValue.arrayRemove(list)

                              });
                              print("Recipe Removed from Favourties, User ID: ${widget.id}");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Row(
                                  children: const [
                                    Icon(
                                      Icons.highlight_remove,
                                      color: Colors.red,
                                      size: 40.0,
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                        child: Text('Removed Successfully!')),
                                  ],
                                ),
                              ));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${recipe.name}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            Icon(
                              Icons.watch_later,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('${recipe.preparationtime} Min'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${recipe.category}',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
