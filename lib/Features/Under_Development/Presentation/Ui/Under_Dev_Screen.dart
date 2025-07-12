import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatefulWidget {
  const UnderDevelopmentScreen({Key? key}) : super(key: key);

  @override
  State<UnderDevelopmentScreen> createState() => _UnderDevelopmentScreenState();
}

class _UnderDevelopmentScreenState extends State<UnderDevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Under Development')),
      body: const Center(child: Text('This screen is under development')),
    );
  }
}
