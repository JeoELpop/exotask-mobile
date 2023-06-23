import 'package:exotask/models/task/post.dart';
import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/modules/home/homepage.dart';
import 'package:exotask/modules/workspace/workspace_screen.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


  Future<String?> getToken() async  
{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  return token;
}

void forceLogin(context) async {
  bool loggedin = await isLoggedIn();
  if(!loggedin){
    Navigator.popAndPushNamed(context, HomePage.id);
  }
}

class Task extends StatefulWidget {
  static String id = 'Task';

  const Task({super.key});
  
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

List<TaskDto> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      final token = await getToken();
      List<TaskDto> tasks = await getPosts(token);
      setState(() {
        _tasks = tasks;
      });
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

    @override
  Widget build(BuildContext context) {
    forceLogin(context);
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
                  elevation: 0,
                  titleSpacing: 20,
        title: Text(currentWorkspace),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (BuildContext context, int index) {
          TaskDto task = _tasks[index];
          return Card(
            color: kMainColor,
            child: Column(
              children: [
                ListTile(
                  title:
                  Text(task.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: KTertiaryColor,
                        fontSize: 20 , 
                      fontWeight: FontWeight.bold), ),
                            subtitle: Text(task.descrpiton ?? '',
                            maxLines: 5,
                            style: TextStyle(
                              color: KTertiaryColor),
                            overflow: TextOverflow.ellipsis
                            ),
                            trailing: Text(task.status ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: KTertiaryColor,
                              fontSize: 20 , 
                            fontWeight: FontWeight.bold),
                            ),
                      ),
                      Divider(
                            color: Colors.grey[300],
                          ),
              ], 
            ),
                  
          );
        },
      ),
    );
  }
}