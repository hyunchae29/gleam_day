import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '더보기',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              '설정',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const Divider(color: Colors.grey),
            _buildSwitchTile(
              title: "알림",
              subtitle: "리마인드 시간을 설정할 수 있어요.",
              value: false,
              onChanged: (value) {
                // 알림 상태 변경 로직
              },
            ),
            const SizedBox(height: 16),
            _buildSwitchTile(
              title: "잠금",
              subtitle: "비밀번호를 설정할 수 있어요.",
              value: true,
              onChanged: (value) {
                // 잠금 상태 변경 로직
              },
            ),
            const Divider(color: Colors.grey, height: 32),
            const Text(
              '정보',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const Divider(color: Colors.grey),
            const ListTile(
              title: Text(
                "앱 버전",
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text(
                "ver. 0.1",
                style: TextStyle(fontSize: 14),
              ),
            ),
            const ListTile(
              title: Text(
                "캐시 지우기",
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text(
                "0.0 MB",
                style: TextStyle(fontSize: 14),
              ),
            ),
            const ListTile(
              title: Text(
                "만든이",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "noday29@gmail.com",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
