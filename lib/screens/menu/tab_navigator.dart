import 'package:anotherrecipeapp/screens/addrecipes.dart';
import 'package:anotherrecipeapp/screens/categories.dart';
import 'package:anotherrecipeapp/screens/homepagey.dart';
import 'package:anotherrecipeapp/screens/profile.dart';
import 'package:anotherrecipeapp/screens/viewfavourites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';



class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}





class TabNavigator extends StatefulWidget {
  final String rool;
  final String email;
  final String id;

  TabNavigator({required this.navigatorKey, required this.tabItem, required this.rool, required this.email, required this.id});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  @override
  Widget build(BuildContext context) {
    Widget? child ;
    if(widget.tabItem == "Page1")
      child = Homepagey(id: widget.id, email: widget.email, rool: widget.rool,);
    else if(widget.tabItem == "Page2")
      child = Categories(id: widget.id, email: widget.email, rool: widget.rool,);


    else if(widget.tabItem == "Page3")
      child = viewFavourites(id: widget.id, email: widget.email, rool: widget.rool,);
    else if(widget.tabItem == "Page4")
      child = AccountProfile(id: widget.id, email: widget.email, rool: widget.rool,);

    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child!
        );
      },
    );
  }
}
