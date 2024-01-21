import 'package:flutter/material.dart';
import '../widgets/auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //Use this check if it's login or register
  bool _showLoginPage = false;

  void togglePages(){
    setState(() {
      _showLoginPage = !_showLoginPage;
    });
  }

  //Use this form key to validate user's input
  final _formKey = GlobalKey<FormState>();

  //Use this to store user inputs
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  handleSubmit() async {
    //Validate user inputs using formkey
    if (_formKey.currentState!.validate()) {
      //Get inputs from the controllers
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      //Check if is login or register
      if(_showLoginPage) {
        await Auth().signInWithEmailAndPassword(email, password);
      } else {
        await Auth().registerWithEmailAndPassword(email, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

/*
    if(_showLoginPage){
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegisterPage(onTap: togglePages);
    }
*/

    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //Add form to key to the Form Widget
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                //Assign controller
                controller:_emailController,
                //Use this function to validate user input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                //Assign controller
                controller:_passwordController,
                obscureText: true,
                //Use this function to validate user
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                //Assigned onPressed to submit
                onPressed: handleSubmit,
                //Conditionally show the button label
                child: Text(_showLoginPage ? 'Login' :'Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
