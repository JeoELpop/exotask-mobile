import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exotask/shared/components/constants.dart';


Future getworkspaces(token) async{
   var url = Uri.parse('https://localhost:7042/GetDetialesProjects?projectId=$currentProjectID');
    var response = await http.get(
    url,
    headers: {
      'Authorization' : 'Bearer $token' 
    }
  );
  if(response.body != null){    
    final body = await jsonDecode(response.body);
    var json = await workspaceFromJson(response.body);
    var a7a = json[0].workSpasceforProject;
    print(a7a);
    return (a7a);
}
    else {
      return 'error';
    }
}
Future getProject(token) async{
   var url = Uri.parse('https://localhost:7042/GetDetialesProjects?projectId=$currentProjectID');
    var response1 = await http.get(
    url,
    headers: {
      'Authorization' : 'Bearer $token' 
    }
  );
  if(response1.body != null){    
    final body = await jsonDecode(response1.body);
    var json = await workspaceFromJson(response1.body);
    return (json);
}
    else {
      return 'error';
    }
}
List<WorkspaceModel> workspaceFromJson(String str) => 
List<WorkspaceModel>.from(json.decode(str).map((x) => 
WorkspaceModel.fromJson(x)));

String workspacetoJson(List<WorkspaceModel> data) =>
 json.encode(List<dynamic>.from(data.map((x) =>
  x.toJson())));

class WorkspaceModel
{
  String? projectName;
  String? descrtpion;
  List<WorkSpasceforProjectData?>? workSpasceforProject;
  
  WorkspaceModel({
  this.projectName,
  this.descrtpion,
  this.workSpasceforProject,
  });


WorkspaceModel.fromJson(Map<String, dynamic> json){
    projectName = json['projectName'];
    descrtpion = json['descrtpion'];
    // workSpasceforProject = List.from(
    //   json['workSpasceforProject']).map((e)=>WorkSpasceforProject.fromJson(e)).toList();
      if (json['workSpasceforProject'] != null) {
         workSpasceforProject = <WorkSpasceforProjectData>[];
         json['workSpasceforProject'].forEach((v) {
         workSpasceforProject!.add(WorkSpasceforProjectData.fromJson(v));
        });
    }
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['projectName'] = projectName;
      data['descrtpion'] = descrtpion;
      data['workSpasceforProject'] =workSpasceforProject != null ? workSpasceforProject!.map((v) => v?.toJson()).toList() : null;
          return data;
      } 
}

class WorkSpasceforProjectData {
  String? workSpaceName;
    int? workspasceid;

    WorkSpasceforProjectData({
    this.workSpaceName,
    this.workspasceid,
    });
  
  WorkSpasceforProjectData.fromJson(Map<String, dynamic> json){
    workSpaceName = json['workSpaceName'];
    workspasceid = json['workspasceid'];
  }
  Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['workSpaceName'] = workSpaceName;
        data['workspasceid'] = workspasceid;
        return data;
  }


}
