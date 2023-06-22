import 'package:exotask/modules/projects/projects_screen.dart';
import 'package:exotask/modules/register/register_screen.dart';
import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/shared/components/components.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/homepage.dart';

void forcered(context) async {
  bool loggedin = await isLoggedIn();
  if(loggedin){
    Navigator.popAndPushNamed(context, ProjectsScreen.id);
  }
}

class LoginScreen extends StatefulWidget 
{
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> 
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  static String id = 'LoginScreen';
  var xcolor =KTertiaryColor;

  @override
  Widget build(BuildContext context)
  {
    forcered(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        titleSpacing: 20,
        title: Text('Login'),
      ),
      body: Container(
        color: Color(0xff152642),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key:  formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      prefix: Icons.email,
                      validate: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Email Address must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      prefix: Icons.lock,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: () 
                      {
                        setState(() 
                        {
                          isPassword = !isPassword;
                        });
                      },
                      validate: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      text: 'Login',
                      function: () async
                      {
                        if(formKey.currentState!.validate())
                        {
                          // print(emailController.text);
                          // print(passwordController.text);
                          UserModel user = await login(email: emailController.text, password: passwordController.text);
                          final token = await getToken();
                          if(token != null){
                            Navigator.popAndPushNamed(context, ProjectsScreen.id);
                          }else{
                            setState(() 
                        {
                          xcolor != xcolor;
                        });
                            xcolor= KFColor;
                          }
                        }
                      },
                      radius: 15,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            'Register Now',
                            
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Error in user name or password',
                        style: TextStyle(color: Color(0xff152642),
                          
                        ),
                        ),
                      ],
                    ),  
                 ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> getToken() async
{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  return token;
}