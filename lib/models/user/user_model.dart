import 'dart:convert';
import 'dart:io';

import 'package:exotask/modules/projects/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class UserModel
{
  final String id;
  final String name;
  final String token;
  UserModel({
    required this.id,
    required this.name,
    required this.token,
  });

}

//register function using http
Future<UserModel> register({
  required String name,
  required String email,
  required String password,
}) async
{
try{
    var url = Uri.parse('http://joeddenn-001-site1.itempurl.com/api/User/Register');
    var response = await http.post(
      url,
      body: {
        'UserName': name,
        'Email': email,
        'Passward': password,
      }
    );
  if(response.statusCode == 200){    final body = jsonDecode(response.body);
      final token = body['token'];

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('userName', name );

    return UserModel(
        id: '1',
        name: name,
        token: token,
      );

}

}
catch(e){      return UserModel(
      id: '-1',
      name: "",
      token: '',
    );}
      return UserModel(
      id: '-1',
      name: "",
      token: '',
    );
    
}

//login function using http
Future<UserModel> login({
  required String email,
  required String password,
}) async
{
  try{
   var url = Uri.parse('http://joeddenn-001-site1.itempurl.com/api/User/Login');
  var response = await http.post(
    url,
    body: {
      'UserNameOrEmail': email,
      'Passward': password,
    }
    );
    if(response.statusCode == 200){    final body = jsonDecode(response.body);
    final token = body['token'];
    final userNameOrEmail = body['userNameOrEmail'];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('userName', userNameOrEmail );

  return UserModel(
      id: '1',
      name: userNameOrEmail,
      token: token,
    );}
  }catch(e){
      return UserModel(
      id: '-1',
      name: "",
      token: '',
    ); 
  }
      return UserModel(
      id: '-1',
      name: "",
      token: '',
    ); 

  }
  

Future<bool> logOut() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey("token")){
    prefs.clear();
    return true;
  }
  return false;
}

Future<bool> isLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.containsKey("token")){
    return true;
  }
  return false;
}