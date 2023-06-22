import 'dart:io';

import 'package:exotask/modules/aboutus/aboutus_screen.dart';
import 'package:exotask/modules/contact/contact.dart';
import 'package:exotask/modules/workspace/workspace_screen.dart';
import 'package:flutter/material.dart';
import 'package:exotask/modules/home/homepage.dart';
import 'package:exotask/modules/login/login_screen.dart';
import 'package:exotask/modules/projects/projects_screen.dart';
import 'package:exotask/modules/register/register_screen.dart';
import 'package:exotask/modules/task/task.dart';
import 'package:exotask/modules/user_task_screen/user_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
  routes: {
    LoginScreen.id: (context) => LoginScreen(),
    AboutUs.id : (context) => AboutUs(),
    RegisterScreen.id : (context) => RegisterScreen(),
    HomePage.id : (context) => HomePage(),
    ProjectsScreen.id : (context) => ProjectsScreen(),
    Task.id : (context) => Task(),
    UserScreen.id : (context) => UserScreen(),
    WorkSpaceScreen.id : (context) => WorkSpaceScreen(),
    Contact.id : (context) => Contact(),  
  },
          );
  }
}
