import 'package:flutter/material.dart';
import 'lock_settings_page.dart';
import 'clear_cache_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        //현재 쓸모없는 것 리스트업 할 생각 없음
        children: [
          ListTile(
            title: const Text('알림 설정'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _showTimePicker(context); // 알람 설정 팝업
            },
          ),
          ListTile(
            title: const Text('잠금 설정'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LockSettingsPage()),
              );
            },
          ),
          ListTile(
            title: const Text('캐시 삭제'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClearCachePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((selectedTime) {
      if (selectedTime != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('알림 시간 설정: ${selectedTime.format(context)}')),
        );
      }
    });
  }
}
