import 'package:flutter/material.dart';

class HonePage extends StatefulWidget {
  const HonePage({super.key});

  @override
  State<HonePage> createState() => _HonePageState();
}

class _HonePageState extends State<HonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home Page"),
    );
}
}