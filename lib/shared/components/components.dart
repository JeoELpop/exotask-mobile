import 'package:exotask/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultButton({
  double width =double.infinity, 
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  void Function()? function,
  required String text,
}) => 
    Container(
                  width: width,
                  height: 40,
                  child: MaterialButton(
                    onPressed: function,
                    child: Text(
                      isUpperCase ? text.toUpperCase() : text,
                      style: TextStyle(
                        color: Colors.white,
                      ),  
                    ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius,),
                      color: background,
                    ),
                );

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  String? Function(String?)? validate,
}) => TextFormField(
                    validator: validate,
                    controller: controller,
                    keyboardType: type,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                      labelText: label,
                      prefixIcon: Icon(prefix),
                      suffixIcon: suffix != null ? IconButton
                      ( onPressed: suffixPressed  as void Function  ()?,
                        icon: Icon(
                        suffix,)):null,
                      border: OutlineInputBorder(),
                    ),
                  );

 Widget defaultIconButton({
  required String text,
  required IconData icon, 
  required final String screen,
  required BuildContext? context,
  }) =>
     Container(
      height:  60,
      width: 125,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          children: [
            TextButton(
              onPressed: () { 
                Navigator.pushNamed(context!, screen);
                },
              child: Text(
              text,
              style: TextStyle(
                      color: KTertiaryColor),
              ),
            ),
            SizedBox(
              width: 15),
             Icon(
              icon,
              color: KTertiaryColor,
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(5),
    );
  