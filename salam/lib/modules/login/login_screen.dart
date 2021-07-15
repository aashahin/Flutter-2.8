import 'package:flutter/material.dart';
import 'package:salam/shared/components/components.dart';

class  LoginScreen  extends StatefulWidget  {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController= TextEditingController();
  var passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  defaultFormField(
                    label: 'Email Address',
                   prefix: Icons.email,
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value){
                      if(value.isEmpty){
                        return 'Email Address must not be empty';
                      }
                    }
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    label: 'Password',
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock_open_outlined,
                    // onChange: (test){print(test);},
                    // onSubmit: (get){print(get);},
                    validate: (value){
                      if (value.isEmpty){
                        return 'Password must not be empty';
                      }
                      // return null;
                    },
                      isPassword: isPassword,
                    suffix:isPassword ?  Icons.visibility : Icons.visibility_off,
                    suffixPressed: (){
                      setState(() {
                        isPassword = !isPassword;

                      });
                    }
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultButton(
                    text: 'Login',
                    function: (){
                      if(_formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                      },
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultButton(
                    text: 'Register',
                    height: 40,
                    radius: 10,
                    isUppercase: true,
                    function: (){
                      print(emailController.text);
                      print(passwordController.text);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(onPressed: (){}, child: Text('Register'))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
