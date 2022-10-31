import 'package:blood_donation/ui/homescreen.dart';
import 'package:blood_donation/ui/auth/login.dart';
import 'package:blood_donation/ui/loginscreen.dart';
import 'package:blood_donation/splashscreen.dart';
import 'package:blood_donation/ui/messagingscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          children: [Text("CATEGORIES"), Icon(Icons.close)],
        ),
      ]),
    );
  }
}

class HomeScreenn extends StatefulWidget {
  const HomeScreenn({super.key});

  @override
  State<HomeScreenn> createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String password = "";
  String confirmPassword = "";

  bool isConfirm = false;

  bool onHover = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: "Trending Validation".text.make(),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(1, 2),
              spreadRadius: 10,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                  height: 40,
                  child: VxDivider(
                    type: VxDividerType.vertical,
                    width: 2,
                    color: Colors.purple,
                  ),
                ),
                "Confirm Password".text.xl.make(),
                const SizedBox(
                  width: 10,
                  height: 40,
                  child: VxDivider(
                    type: VxDividerType.vertical,
                    width: 2,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            40.heightBox,
            VxTextField(
              labelText: "Enter Password",
              controller: passwordController,
              isPassword: true,
              fillColor: Colors.transparent,
              borderColor: Colors.purple,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            40.heightBox,
            VxTextField(
              labelText: "Reenter Password",
              controller: confirmPasswordController,
              isPassword: true,
              fillColor: Colors.transparent,
              borderColor:
                  password != confirmPassword ? Colors.red : Colors.purple,
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
            ),
            40.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isConfirm,
                  onChanged: (value) {
                    setState(() {
                      isConfirm = value as bool;
                    });
                  },
                ),
                "Confirm".text.make(),
              ],
            ),
            20.heightBox,
            password == confirmPassword && onHover == true
                ? AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(),
                            child: "confirm".toUpperCase().text.make(),
                          ),
                        ),
                      ],
                    ),
                  )
                : AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    child: Row(
                      mainAxisAlignment: onHover
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        MouseRegion(
                          onHover: (event) {
                            setState(() {
                              onHover = onHover.toggle();
                            });
                          },
                          child: SizedBox(
                            width: 120,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(),
                              child: "confirm".toUpperCase().text.make(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ).pSymmetric(h: 30),
      ).centered(),
    );
  }
}
