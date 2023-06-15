import 'package:exotask/modules/aboutus/aboutus_screen.dart';
import 'package:exotask/modules/login/login_screen.dart';
import 'package:exotask/modules/register/register_screen.dart';
import 'package:exotask/shared/components/components.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';

import '../contact/contact.dart';

class HomePage extends StatelessWidget
{
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
          double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
                  backgroundColor: kMainColor,
                  elevation: 0,
                  titleSpacing: 20,
                  title: Row(
          children: [
            Text(
              'ExoTask',
              style: TextStyle (
                      fontSize: 25,
                    ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: kMainColor,
              radius: 15,
              child: Icon(
                Icons.login,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
      body:ListView(
          children: [
            Container(
              color: kMainColor,
              height: 225,
              padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Start Working',style: TextStyle(
                                        fontSize: 25,
                                      color: KTertiaryColor,
                                      fontWeight: FontWeight.bold),
                                      ),
                                      Text('Smart Now',style: TextStyle(
                                        fontSize: 25,
                                        color: KTertiaryColor,
                                        fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                  height: 10,
                                ),
                                    Text('A new and Innovative way to',
                                    style: TextStyle(
                                      color: KTertiaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    Text('Work Collaborate, and lrean',
                                    style: TextStyle(
                                      color: KTertiaryColor,
                                    fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                            ),
                                            foregroundColor: kSecondaryColor,
                                            backgroundColor: kMainColor,
                                            padding: const EdgeInsets.all(16.0),
                                            textStyle: const TextStyle(fontSize: 16),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(context, RegisterScreen.id);
                                            },
                                            child: const Text(
                                              'Get Started Now',
                                              style: TextStyle(
                                                color: KTertiaryColor,
                                                ),
                                                ),
                                                ),
                                  ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration( 
                        image: DecorationImage(
                          fit:BoxFit.cover,
                          image: AssetImage(
                            'lib/images/icon/icon2.png',
                            ),
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),                    
                  ],                  
                ),
               ),               
              ],
            ),  
              ),
              Container(
                color: kMainColor,
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      width: double.infinity,
                      color: kMainColor,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            defaultIconButton(
                              icon: Icons.phone,
                              text: 'Contact',
                              screen: Contact.id,
                              context: context, 
                            ),
                            defaultIconButton(
                              icon: Icons.person,
                              text: 'AboutUs',
                              screen: AboutUs.id,
                              context: context, 
                            ),
                            defaultIconButton(
                              icon: Icons.troubleshoot,
                              text: 'Reparing',
                              screen: LoginScreen.id, 
                              context: context, 

                            ),
                          ],
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
                    Container(
                      height: 440,
                      decoration: BoxDecoration( 
                          image: DecorationImage(
                            fit:BoxFit.cover,
                            image: AssetImage(
                              'lib/images/icon/img.png',
                              ),
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                    ),
                

          ],   
         ), 
    );
  }
}