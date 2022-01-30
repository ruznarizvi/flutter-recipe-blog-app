import 'package:anotherrecipeapp/screens/viewfavourites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../databasehelper.dart';
import 'loginpage.dart';

class AccountProfile extends StatefulWidget {
  //const AccountProfile({Key? key}) : super(key: key);

  final String rool;
  final String email;
  final String id;

  AccountProfile({required this.rool, required this.email, required this.id});

  @override
  _AccountProfileState createState() => _AccountProfileState();
}

class _AccountProfileState extends State<AccountProfile> {
  DatabaseHelper _db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Manage Account",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Email: ${widget.email}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 205.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    onPressed: () {
                      //access logout function in databaseHelper class
                      //using _db object created
                      _db.logout(context);
                      //navigate to login page
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                      icon:
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      );
                    },
                    color: Colors.yellow,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )),
              ),
            ),

            // IconButton(
            //         onPressed: () {
            //           _db.logout(context);
            //           Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            //             builder: (_) => LoginPage(),
            //           ),
            //           );
            //         },
            //         icon: Icon(Icons.logout),
            //       ),
          ],
        ),
      ),
    ));
  }
}
