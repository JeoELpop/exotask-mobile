
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
    static String id = 'AboutUs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
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
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(left: 0),
                                                    child: Row(
                                                      children: [
                                                        Text('What we\'re trying to do?',style: TextStyle(
                                                    fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                                  ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Reinvent collaborative work in a way that is more productive, more engaging, and more effecient.',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                  ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Divider(
                                  color: Colors.white,
                                ),
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(left: 0),
                                                    child: Row(
                                                      children: [
                                                        Text('Who are we?',style: TextStyle(
                                                    fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                                  ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('We\'re a team of passionate and dedicated developers from egypt who are trying to make a difference in the world and make something that will change the way we work.',
                                                style: TextStyle(
                                                  fontSize: 15,
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
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(left: 0),
                                                    child: Row(
                                                      children: [
                                                        Text('Future Plans',style: TextStyle(
                                                    fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                                  ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('We\'re planning to add more features to the platform and make it more powerful and useful for everyone. things like live chat, video conferencing, and AI powered suggestions are on the way.',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                  ),
                                              ],
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