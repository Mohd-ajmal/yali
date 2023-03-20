import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AcceptDeclineScreen extends StatefulWidget {
  const AcceptDeclineScreen({super.key});

  @override
  State<AcceptDeclineScreen> createState() => _AcceptDeclineScreenState();
}

class _AcceptDeclineScreenState extends State<AcceptDeclineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You got an order!"),
      ),
      body: Container(
        child: Center(
          child: Text("Order receiving screen"),
        ),
      ),
    );
  }
}
