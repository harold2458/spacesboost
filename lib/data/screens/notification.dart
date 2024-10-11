import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0XFFFCBC1C),
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset('assets/logos/icon.png'),
          ),),
        body: const Center(child: Text('Notification'))
    );
  }
}
