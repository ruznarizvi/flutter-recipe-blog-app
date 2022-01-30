import 'package:anotherrecipeapp/databasehelper.dart';
import 'package:anotherrecipeapp/screens/headerdelegate.dart';
import 'package:anotherrecipeapp/screens/recipecategorydetails.dart';
import 'package:anotherrecipeapp/screens/recipesearchdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Categories extends StatefulWidget {
  //const Categories({Key? key}) : super(key: key);

  final String rool;
  final String email;
  final String id;

  Categories({required this.rool, required this.email, required this.id});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  bool _contentVisible = true;
  final searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    DatabaseHelper _db = new DatabaseHelper();
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(slivers: <Widget>[
            SliverPersistentHeader(
              delegate: SectionHeaderDelegate(
                  "expandedHeight: 300, title: widget.info"),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 142.0,
                        bottom: 20,
                        left: 20.0
                      ),
                      child: TextField(

                        controller: searchController..text,

                        // onTap: (){
                        //   setState(() {
                        //     _contentVisible = false;
                        //   });
                        //
                        // },

                        // onChanged: (value) {
                        //   // setState(() {
                        //   //   //passing the entered value to the
                        //   //   //filter search method
                        //   //   filterSeach(value);
                        //   // });
                        // },
                        // onChanged: (val) => initiateSearch(val),
                        //controller: toSearch,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

                          // enabledBorder: const OutlineInputBorder(
                          //   borderSide: const BorderSide(
                          //     color: Colors.white,
                          //
                          //
                          //   ),
                          //   borderRadius: BorderRadius.all(Radius.circular(15))
                          // ),
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.black),
                          //labelText: 'Search',
                          labelStyle: TextStyle(color: Colors.black),
                          //fillColor: Colors.orange, filled: true,
                          // suffixIcon: Icon(
                          //   Icons.search,
                          //   color: Colors.black,
                          //
                          //
                          // ),
                          suffixIcon: IconButton(
                            onPressed: (){

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                  // TaskCardWidget(id: user.id, name: user.ingredients,)
                                  RecipeSearchDetails(
                                      id: widget.id,
                                      rool: widget.rool,
                                      email: widget.email,
                                      name: searchController.text
                                  )
                              ));


                            },
                            icon: Icon(Icons.search),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Visibility(
                      visible: _contentVisible,
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 20.0,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Burger")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.mashed.com/img/gallery/only-14-percent-of-people-consider-this-the-best-fast-food-burger/intro-1624562493.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Burger",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Pizza")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://nmgprod.s3.amazonaws.com/media/files/55/b9/55b95dc8c93c62a4e736da7b48f82160/cover_image_1603890803.jpg.760x400_q85_crop_upscale.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Pizza",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Biriyani")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.freepik.com/free-photo/chicken-biryani-food-photography_162831-13.jpg?size=626&ext=jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Biriyani",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Pasta")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://static.onecms.io/wp-content/uploads/sites/44/2020/06/12/8246835.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Pasta",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                  // TaskCardWidget(id: user.id, name: user.ingredients,)
                                  RecipeCategoryDetails(
                                      id: widget.id,
                                      rool: widget.rool,
                                      email: widget.email,
                                      category: "Vegetarian")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://images-prod.healthline.com/hlcmsresource/images/AN_images/vegetarian-diet-plan-1296x728-feature.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Vegetarian",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Coffee and Tea")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://roastberry.pt/wp-content/uploads/2019/09/specialty-coffee-tea.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Coffee & Tea",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Cupcakes")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn.lifehack.org/wp-content/uploads/2016/05/20032046/7438866342_01739e61da_o_d.png'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Cupcakes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      // TaskCardWidget(id: user.id, name: user.ingredients,)
                                      RecipeCategoryDetails(
                                          id: widget.id,
                                          rool: widget.rool,
                                          email: widget.email,
                                          category: "Drinks and Shakes")));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://static.onecms.io/wp-content/uploads/sites/19/2011/06/07/GetAttachmentThumbnail-2.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.3),
                                      BlendMode.colorBurn),
                                ),
                              ),
                              height: 160.0,
                              width: 160.0,
                              child: Center(
                                child: Text(
                                  "Drinks & Shakes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

}
