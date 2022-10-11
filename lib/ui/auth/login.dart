import 'package:blood_donation/ui/auth/signup_screen.dart';
import 'package:blood_donation/ui/loginscreen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image(
              image: AssetImage('assets/images/asia.png'),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 16,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade100,
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text('Login',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.green.shade900,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 16,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green.shade400,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade300,
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.green.shade900,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
