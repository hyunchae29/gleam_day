import 'package:flutter/material.dart';

class Success1 extends StatefulWidget {
  const Success1({super.key});

  @override
  State<Success1> createState() => _Success1State();
}

class _Success1State extends State<Success1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201D1D),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    'Recommendation Reasons',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    indent: 40.0,
                    endIndent: 40.0,
                  ),
                ],
              ),
            ),
          ),
          // Bottom spacer
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
