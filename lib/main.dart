import 'package:anotherrecipeapp/provider/google_sign_in.dart';
import 'package:anotherrecipeapp/screens/homepagey.dart';
import 'package:anotherrecipeapp/screens/loginpage.dart';
import 'package:anotherrecipeapp/screens/menu/menu.dart';
import 'package:anotherrecipeapp/screens/register.dart';
import 'package:anotherrecipeapp/services/routingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
        ),
      );
}
