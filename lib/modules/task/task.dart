import 'package:exotask/models/task/post.dart';
import 'package:exotask/modules/workspace/workspace_screen.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:exotask/shared/network/remote/remote_service.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  static String id = 'Task';
  @override
  State<Task> createState() => _TaskState();
}

listname(id){
  if(id == 1){
    return 'TODO';
  }
  else if(id == 2){
    return 'DOING';
  }
  else if(id == 3){
    return 'DONE';
  }
  else{
    return 'list';
  }
}

class _TaskState extends State<Task> {
  List<Post>? posts = [];
  var isLoading = false;
  @override
  void initState() {
    super.initState();

    //fetch data from api
    getData();
  }
  getData() async {
    posts = await RemoteService().getPosts();
    if(posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
                  elevation: 0,
                  titleSpacing: 20,
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: kMainColor,
              radius: 15,
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, WorkSpaceScreen.id);
            },
          ),
        ],
      ),
      body:
          ListView.builder(
            itemCount: posts!.length,
            itemBuilder: (context, index) {
              return Container(
                color: kSecondaryColor,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: kMainColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listname(posts![index].id),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: KTertiaryColor,
                                  fontSize: 20 , 
                                fontWeight: FontWeight.bold),
                                ),
                                Text(posts![index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: KTertiaryColor,
                                  fontSize: 20 , 
                                fontWeight: FontWeight.bold), ),
                                Text(posts![index+1].body,
                                maxLines: 3,
                                style: TextStyle(
                                  color: KTertiaryColor),
                                overflow: TextOverflow.ellipsis
                                ),
                                Divider(
                            color: Colors.grey[300],
                          ),
                          Text(posts![index+1].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: KTertiaryColor,
                                  fontSize: 20 , 
                                fontWeight: FontWeight.bold), ),
                                Text(posts![index].body,
                                maxLines: 3,
                                style: TextStyle(
                                  color: KTertiaryColor),
                                overflow: TextOverflow.ellipsis
                                ),
                                Divider(
                            color: Colors.grey[300],
                          ),
                          Text(posts![index+2].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: KTertiaryColor,
                                  fontSize: 20 , 
                                fontWeight: FontWeight.bold), ),
                                Text(posts![index+2].body,
                                maxLines: 3,
                                style: TextStyle(
                                  color: KTertiaryColor),
                                overflow: TextOverflow.ellipsis
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),  
                  ],
                ),
              );
            },
          )
    );
  }
}