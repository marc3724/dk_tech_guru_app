import 'package:dk_tech_guru_app/5th_semester_project/model_view_controller/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../views/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData){
              return const HomePage();
            }

            //user is NOT logged int
            else{
              return LoginAndRegister();
            }
          }
      ),
    );
  }
}