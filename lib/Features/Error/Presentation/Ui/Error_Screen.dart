import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  final String? message;

  const ErrorScreen({Key? key, this.message}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(child: Text(widget.message ?? 'An unknown error occurred')),
    );
  }
}
