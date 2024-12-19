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
          const SizedBox(height: 80.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '아직 추가된 게 없어요!',
                style: const TextStyle(
                  fontFamily: 'GowunBatang',
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              Icon(
                Icons.add_reaction_outlined,
                size: 150.0,
                color: Colors.white,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  // TODO: Add navigation or action logic here okay
                },
                child: const Text(
                  '나만의 오늘 추가하기',
                  style: TextStyle(
                    fontFamily: 'GowunBatang',
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
