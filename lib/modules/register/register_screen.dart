import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/modules/login/login_screen.dart';
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
        title: Text('Singup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Singup',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
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
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
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
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
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
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
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
    );
  }
}
