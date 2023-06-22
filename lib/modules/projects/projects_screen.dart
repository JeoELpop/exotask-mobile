import 'package:exotask/modules/workspace/workspace_screen.dart';
import 'package:exotask/models/projects/project_model.dart';
import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/modules/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:exotask/shared/components/constants.dart';


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

class ProjectsScreen extends StatefulWidget {

  static String id = 'ProjectsScreen';

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<ProjectModel>? user = [];

var isLoading = false;
  @override
  void initState() {
    super.initState();

    //fetch data from api
    getProjectList();
  }
  getProjectList() async {
    final token = await getToken();
    user = await getProjects(token);
    if(user != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    forceLogin(context);
    return Scaffold(
      backgroundColor: Color(0xff152642),
      appBar: AppBar(
        backgroundColor: Color (0xff2f4562),
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xff2f4562),
              radius: 25,
              child: Icon(
                Icons.person,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Projects',
              style: TextStyle(
                color: Colors.grey[350],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Color(0xff2f4562),
              radius: 15,
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            onPressed: () async {
              try{
                final loggedout = await logOut();
                if(loggedout){
                  Navigator.popAndPushNamed(context, HomePage.id);
                }
              }catch(e){

              }
            },
          ),
        ],
      ),
      body:
      Container(
        color: Color(0xff152642),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  itemCount: user!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildProjectItem(user![index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//arrow function
  Widget buildProjectItem(ProjectModel user) => InkWell(
    onTap: (){
      currentProject = user.name;
      currentProjectID = user.id;

      Navigator.popAndPushNamed(context, WorkSpaceScreen.id);
    },
    child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  
                  Divider(
                        color: Colors.grey[300],
                      ),
                ],
              ),
            ),
          ],
        ),
  );
}