import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salam/shared/components/components.dart';

class  LoginScreen  extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController= TextEditingController(); // التحكم في حقل الايميل

  var passwordController = TextEditingController(); // التحكم في حقل كلمة المرور

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center( // توسيط العناصر الموجوده به
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType:TextInputType.emailAddress ,
                  controller: emailController, // التحكم في الحقل من خلال ربطه بزر التسجيل او الدخول لارسال البيانات للمطور
                  onFieldSubmitted: (get){ // يرسل للمطور البيانات التي تم ادخالها في الحقل
                    print(get);
                  },
                  onChanged: (test){print(test);}, // يرسل للمطور البيانات التي يتم اداخلها في حقل وسجل المستخدم في الحقل
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email
                    )
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType:TextInputType.visiblePassword ,
                  controller: passwordController,
                  obscureText: true, // اخفاء المحتوي
                  onFieldSubmitted: (get){print(get);},
                  onChanged: (test){print(test);},
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                          Icons.lock
                      ),
                    suffixIcon: Icon( // ايقونة في نهاية الحقل
                      Icons.remove_red_eye_outlined
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                defaultButton(
                  text: 'Login',
                  width: double.infinity,
                  function: (){print('Hello');},
                  background: Colors.blue,
                  height: 50
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'), // نضع باك سلاش حتي يقرأ الفاصلة كنص
                    TextButton(onPressed: (){}, child: Text('Register')) // زر بدون خلفية
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
