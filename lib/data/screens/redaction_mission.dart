import 'package:flutter/material.dart';

class RedactionMission extends StatefulWidget {
  const RedactionMission({super.key});

  @override
  State<RedactionMission> createState() => _RedactionMissionState();
}

class _RedactionMissionState extends State<RedactionMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("mission"),
      ),
    );
  }
}
