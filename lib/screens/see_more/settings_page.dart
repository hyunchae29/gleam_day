import 'package:flutter/material.dart';

//shared preference 추가필요

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isAlarmOn = false;
  bool isLockOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201D1D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    '더보기',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '설정',
                  style: TextStyle(
                    fontFamily: 'GowunBatang',
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF373333),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isAlarmOn ? '알림 ON' : '알림 OFF',
                            style: const TextStyle(
                              fontFamily: 'GowunBatang',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            '리마인드 시간을 설정할 수 있어요',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isAlarmOn,
                        onChanged: (value) {
                          setState(() {
                            isAlarmOn = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF373333),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLockOn ? '잠금 ON' : '잠금 OFF',
                            style: const TextStyle(
                              fontFamily: 'GowunBatang',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            '비밀번호를 설정할 수 있어요',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        value: isLockOn,
                        onChanged: (value) {
                          setState(() {
                            isLockOn = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                const Text(
                  '정보',
                  style: TextStyle(
                    fontFamily: 'GowunBatang',
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF373333),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '앱 버전',
                        style: TextStyle(
                          fontFamily: 'GowunBatang',
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'ver. 0.1',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF373333),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '캐시 지우기',
                        style: TextStyle(
                          fontFamily: 'GowunBatang',
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '0.0 MB',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF373333),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 변경된 부분
                    children: [
                      Text(
                        '만든이',
                        style: TextStyle(
                          fontFamily: 'GowunBatang',
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'noday29@gmail.com',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
