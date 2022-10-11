import 'package:blood_donation/ui/homescreen.dart';
import 'package:blood_donation/ui/loginscreen.dart';
import 'package:blood_donation/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Image(
                    image: AssetImage('assets/images/asia.png'),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 1.2,
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
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '  Username',
                            prefixIcon: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey.shade600,
                            ),
                            prefixIconConstraints:
                                BoxConstraints(minWidth: 50, maxHeight: 40),
                            hintStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 60,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 16,
                  width: MediaQuery.of(context).size.width / 1.2,
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
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                        color: Colors.grey.shade600,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(minWidth: 50, maxHeight: 40),
                      hintStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 60,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      _auth
                          .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) {
                        utils().toastMessage(value.user!.email.toString());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                        setState(() {
                          loading = false;
                        });
                      }).onError((error, stackTrace) {
                        utils().toastMessage(error.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 1.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green.shade400,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade200,
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: loading
                          ? CircularProgressIndicator()
                          : Text('Sign Up',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              )),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.5,
                ),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text('Already have an account? Login',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 56,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade600,
                        )),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
