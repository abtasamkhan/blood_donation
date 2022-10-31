import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
                color: Colors.green.shade400,
                height: MediaQuery.of(context).size.height / 16,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  'Messaging',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8, left: 4),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  child: const Text('AH'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
