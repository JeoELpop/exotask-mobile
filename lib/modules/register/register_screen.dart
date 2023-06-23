import 'package:exotask/models/user/user_model.dart';
import 'package:exotask/modules/login/login_screen.dart';
import 'package:exotask/shared/components/components.dart';
import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../projects/projects_screen.dart';

void forcered(context) async {
  bool loggedin = await isLoggedIn();
  if(loggedin){
    Navigator.popAndPushNamed(context, ProjectsScreen.id);
  }
}

class RegisterScreen extends StatefulWidget 
{ 
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var UsernameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var ConfrimpasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  var xcolor = Color(0xff152642);

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
              child: Form(
                key:  formKey,
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
                    defaultFormField(
                        controller: ConfrimpasswordController,
                        type: TextInputType.visiblePassword,
                        label: 'Confrim Password',
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
                            return 'Confrim Password must not be empty';
                          }
                          return null;
                        },
                      ),
                     SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      color: kSecondaryColor,
                      height: 40,
                      child: MaterialButton(
                        onPressed: ()async
                        {
                          if(formKey.currentState!.validate())
                        {
                          
                          if(passwordController.text == ConfrimpasswordController.text){
                            register(name: UsernameController.text, email: emailController.text, password: passwordController.text);
                            UserModel user = await login(email: emailController.text, password: passwordController.text);
                          final token = await getToken();
                            if(token != null){
                            Navigator.popAndPushNamed(context, ProjectsScreen.id);
                          }
                          }else{
                            
                            setState(() 
                          {
                            xcolor != xcolor;
                          });
                              xcolor= KFColor;
                            
                          }
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