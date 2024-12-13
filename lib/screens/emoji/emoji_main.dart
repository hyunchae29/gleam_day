import 'package:flutter/material.dart';

class EmojiMain extends StatefulWidget {
  const EmojiMain({super.key});

  @override
  State<EmojiMain> createState() => _EmojiMainState();
}

class _EmojiMainState extends State<EmojiMain> {
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
                    '나만의 오늘',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'GowunBatang',
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
