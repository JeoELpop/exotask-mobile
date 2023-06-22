import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/models/workspaces/workspaces_model.dart';
import 'package:exotask/modules/home/homepage.dart';
import 'package:exotask/modules/task/task.dart';
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

class WorkSpaceScreen extends StatefulWidget {
  static String id = 'WorkSpaceScreen';

  const WorkSpaceScreen({super.key});

  @override
  State<WorkSpaceScreen> createState() => _WorkSpaceScreenState();
}

class _WorkSpaceScreenState extends State<WorkSpaceScreen> {

  List<WorkspaceModel>? proj = [];

var isLoading = false;
  @override
  void initState() {
    super.initState();

    //fetch data from api
    getWorkSpaceList();

  }

  getWorkSpaceList() async {
    final token = await getToken();
    proj = await getworkspaces(token);
    if(proj != null) {
      setState(() {
        isLoading = true;
      });
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
        title: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              '${proj?.first.projectName}',
              style: TextStyle(
                color: KTertiaryColor,
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
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('${proj?.first.descrtpion}'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                itemCount: proj!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildProjectItem(proj![index],index),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
  

//arrow function
  Widget buildProjectItem(WorkspaceModel proj,int index) => InkWell(
    onTap: (){
      currentWorkspace = '${proj.workSpasceforProject?[index]?.workSpaceName}';
      currentWorkspaceID = proj.workSpasceforProject?[index]?.workspasceid??0;

      Navigator.popAndPushNamed(context, Task.id);
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
                     '${proj.workSpasceforProject?[index]?.workSpaceName}',
                    style: TextStyle(
                      color: KTertiaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                        ),
                      ),
                      Text(
                        '02:00 PM',
                        style: TextStyle(
                          color: KTertiaryColor,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}