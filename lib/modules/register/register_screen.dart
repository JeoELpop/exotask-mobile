import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/modules/login/login_screen.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';
import '../projects/projects_screen.dart';

void forcered(context) async {
  bool loggedin = await isLoggedIn();
  if(loggedin){
    Navigator.popAndPushNamed(context, ProjectsScreen.id);
  }
}

class RegisterScreen extends StatelessWidget 
{ 
  static String id = 'RegisterScreen';
  var UsernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfrimpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    forcered(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        titleSpacing: 20,
        title: Text('Singup'),
      ),
      body: Container(
        color: Color(0xff152642),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Singup',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: UsernameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String value)
                    {
      
                    },
                    onChanged: (String value)
                    {
      ;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value)
                    {
      
                    },
                    onChanged: (String value)
                    {
      
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value)
                    {
      
                    },
                    onChanged: (String value)
                    {
      
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Colors.white,
                      suffixIcon: Icon(Icons.remove_red_eye,
                      color: Colors.white,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: ConfrimpasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (String value)
                    {
                    },
                    onChanged: (String value)
                    {
      
                    },
                    decoration: InputDecoration(
                      labelText: 'Confrim Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: Colors.white,
                      suffixIcon: Icon(Icons.remove_red_eye,
                      color: Colors.white,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    color: kSecondaryColor,
                    height: 40,
                    child: MaterialButton(
                      onPressed: ()
                      {
                        // print(UsernameController.text);
                        // print(emailController.text);
                        // print(passwordController.text);
                        // print(ConfrimpasswordController.text);
                        //call register function
                        if(passwordController.text == ConfrimpasswordController.text){
                          register(name: UsernameController.text, email: emailController.text, password: passwordController.text);
                        }else{
                          
                        }
      
                      },
                      child: Text(
                        'Singup',
                        style: TextStyle(
                          color: Colors.white,
                        ),  
                      ),
                      ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: Text(
                          'Login Now',
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
    );
  }
}
