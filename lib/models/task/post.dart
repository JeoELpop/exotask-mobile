
import 'dart:convert';
import 'package:exotask/shared/components/constants.dart';
import 'package:http/http.dart' as http;

// Future getPosts(token) async{
//    var url = Uri.parse('http://joeddenn-001-site1.itempurl.com/GetALLinWorkspascce?WorkspasceID=$currentWorkspaceID');
//     var response = await http.get(
//     url,
//     headers: {
//       'Authorization' : 'Bearer $token' 
//     }
//   );
//     if (response.body != null) {
//     final body = await jsonDecode(response.body);
//     var json = await postFromJson(response.body);
//     var wks = json[0].taskDtos;
//     return (wks);

//   } else {
//     return 'error';
//   }
// }




// List<Post> postFromJson(String str) =>
// List<Post>.from(json.decode(str).map((x) =>
// Post.fromJson(x)));

// String posttoJson(List<Post> data) =>
//  json.encode(List<dynamic>.from(data.map((x) =>
//   x.toJson())));

// class Post {
//     List<TaskDto?>? taskDtos;

//     Post({
//       this.taskDtos,
//     });

//     Post.fromJson(Map<String, dynamic> json){
//     if (json['taskDtos'] != null) {
//          taskDtos = <TaskDto>[];
//          json['taskDtos'].forEach((v) {
//          taskDtos!.add(TaskDto.fromJson(v));
//         });
//     }
//     }
    

//  Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['taskDtos'] =
//     taskDtos != null ? taskDtos!.map((v) => 
//     v?.toJson()).toList() : null;
//           return data;
//   }
// }


// class TaskDto {
//     int? id;
//     String? descrpiton;
//     String? title;
//     String? status;

//     TaskDto({
//       this.id, 
//       this.descrpiton, 
//       this.title, 
//       this.status}); 

//     TaskDto.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     descrpiton = json['descrpiton'];
//     title = json['title'];
//     status = json['status'];
//   }
//     Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['descrpiton'] = descrpiton;
//     data['title'] = title;
//     data['status'] = status;
//     return data;
//   }
// }
Future<List<TaskDto>> getPosts(token) async {
  var url = Uri.parse('http://joeddenn-001-site1.itempurl.com/GetALLinWorkspascce?WorkspasceID=$currentWorkspaceID');
  var response = await http.get(
    url,
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    var post = Post.fromJson(json);
    return post.taskDtos ?? [];
  } else {
    throw Exception('Failed to load posts');
  }
}

class Post {
  List<TaskDto>? taskDtos;

  Post({this.taskDtos});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      taskDtos: json['taskDtos'] != null
          ? List<TaskDto>.from(json['taskDtos'].map((x) => TaskDto.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskDtos': taskDtos?.map((x) => x.toJson()).toList(),
    };
  }
}

class TaskDto {
  int? id;
  String? descrpiton;
  String? title;
  String? status;

  TaskDto({this.id, this.descrpiton, this.title, this.status});

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      id: json['id'],
      descrpiton: json['descrpiton'],
      title: json['title'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descrpiton': descrpiton,
      'title': title,
      'status': status,
    };
  }
}