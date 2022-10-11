import 'package:blood_donation/splashscreen.dart';
import 'package:blood_donation/ui/auth/login.dart';
import 'package:blood_donation/ui/loginscreen.dart';
import 'package:blood_donation/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade100,
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  Search',
                        prefixIcon: Icon(
                          Icons.search,
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
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 8,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade100,
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                        onTap: () {
                          auth.signOut().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }).onError((error, stackTrace) {
                            utils().toastMessage(error.toString());
                          });
                        },
                        child: Icon(Icons.settings_outlined)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 5.6,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green.shade200,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade100,
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 3.2,
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 180,
                                  top: 40,
                                  child: Text(
                                    'Know more\n  about us \n        ...',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Image(image: AssetImage("assets/images/asia.png"))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade100,
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 3.2,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Image(
                              image: AssetImage("assets/images/asia.png")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade100,
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height / 3.4,
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Image(
                              image: AssetImage("assets/images/asia.png")),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                '   How Can We help you ?',
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3.6,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade100,
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 20.4,
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/blreqicon.png"))),
                          ),
                          Text(
                            '  Recent\nRequests',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3.6,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade100,
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Icon(
                              Icons.roofing,
                              size: 50,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          Text(
                            'Blood Bank',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 3.6,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.shade100,
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.0),
                            child: Icon(
                              Icons.people,
                              size: 50,
                              color: Colors.green.shade400,
                            ),
                          ),
                          Text(
                            'Donors\nnear you',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 238.0),
              child: Text(
                ' Recent donors',
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.68,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade100,
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.green.shade400,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Osama',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Donated : 2 Units',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.shade100,
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                'A+',
                                style: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade100,
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.green.shade400,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'jhon',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Donated : 2 Units',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.shade100,
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                'AB+',
                                style: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade100,
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.green.shade400,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'jhon',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Donated : 2 Units',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.shade100,
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                'B+',
                                style: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade100,
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.green.shade400,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'jhon',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Donated : 2 Units',
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.shade100,
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Text(
                                'A+',
                                style: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade400,
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.other_houses_outlined,
                            size: 30,
                            color: Colors.blue.shade800,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.grey.shade900),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 24.4,
                            child: Image(
                                image: AssetImage(
                                    "assets/images/bloodneedicon.png"))),
                        Text(
                          'Donate',
                          style: TextStyle(color: Colors.grey.shade900),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 24.4,
                            child: Image(
                                image:
                                    AssetImage("assets/images/receicon.png"))),
                        Text(
                          'Receive',
                          style: TextStyle(color: Colors.grey.shade900),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: 30,
                            color: Colors.green.shade400,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(color: Colors.grey.shade900),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
