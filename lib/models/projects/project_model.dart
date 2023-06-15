import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future getProjects(token) async{
  var url = Uri.parse('https://localhost:7042/GetProjcts');
  var response = await http.get(
    url,
    headers: {
      'Authorization' : 'Bearer $token' 
    }
  );
  if(response.statusCode == 200){    
    final body = jsonDecode(response.body);
    var json = response.body;
    return projectFromJson(json);
}
    else {
      return 'error';
    }
}

List<ProjectModel> projectFromJson(String str) => List<ProjectModel>.from(json.decode(str).map((x) => ProjectModel.fromJson(x)));

String projecttoJson(List<ProjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectModel
{
  final String name;
  final int id;

  ProjectModel({
    required this.name,
    required this.id
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        name: json["name"],
        id: json["id"],

    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };

}