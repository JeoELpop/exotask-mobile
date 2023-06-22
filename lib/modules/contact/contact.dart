import 'package:exotask/modules/webview_screen/webview_screen.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:exotask/modules/webview_screen/webview_screen.dart';
  
class Contact extends StatelessWidget {
  static String id = 'Contact';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
        titleSpacing: 20,
      ),
      body: Container(
        color: kMainColor,
        child: Column(
          children: [
            Container(
              color: kMainColor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 0),
                              child: Row(
                                children: [
                                  Text(
                                    'Contact Us At',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: (){
                                // Navigator.pushNamed(context, WebViewScreen.id);
                              },
                        child: Text(
                          'Email: Exotask@Gmail.com',
                          style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                          
                        ),
                      )
                      ,
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '  Phone: 01000000000',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

