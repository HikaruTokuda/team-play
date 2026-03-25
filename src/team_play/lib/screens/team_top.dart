import 'package:flutter/material.dart';

class TeamTop extends StatefulWidget {
  const TeamTop({super.key});

  @override
  State<TeamTop> createState() => _TeamTop();
}

class _TeamTop extends State<TeamTop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team A'),
      ),
      body: Container(),
    );
  }
}