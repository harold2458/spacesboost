import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationEntreprise extends StatefulWidget {
  const NotificationEntreprise({super.key});

  @override
  State<NotificationEntreprise> createState() => _NotificationEntrepriseState();
}

class _NotificationEntrepriseState extends State<NotificationEntreprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Notification"),
      ),
    );
  }
}