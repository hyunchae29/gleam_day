import 'package:flutter/material.dart';

class MemoMain extends StatefulWidget {
  const MemoMain({super.key});

  @override
  State<MemoMain> createState() => _MemoMainState();
}

class _MemoMainState extends State<MemoMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201D1D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    '오늘을 기록',
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
            children: [
              Text(
                '아직 추가된 게 없어요!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'GowunBatang',
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              Icon(
                Icons.edit_note,
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
                  '오늘을 기록 추가하기',
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
