import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MemberSettings extends StatefulWidget {
  const MemberSettings({Key? key}) : super(key: key);

  @override
  State<MemberSettings> createState() => _MemberSettingsState();
}

class _MemberSettingsState extends State<MemberSettings> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeTimeZoneAndNotifications();
  }

  Future<void> _initializeTimeZoneAndNotifications() async {
    tz.initializeTimeZones(); // 시간대 초기화
    await _initNotifications(); // 알림 초기화
  }

  Future<void> _initNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSSettings =
        DarwinInitializationSettings();
    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);

    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> _showNotification() async {
    print('알림 버튼 클릭됨');
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            importance: Importance.high, priority: Priority.high);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
        0, '테스트 알림', '이것은 테스트 알림입니다!', notificationDetails);
    print('알림 요청 실행됨');
  }

  Future<void> _pickTimeAndScheduleNotification() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      DateTime now = DateTime.now();
      DateTime scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      if (scheduledTime.isBefore(now)) {
        scheduledTime = scheduledTime.add(const Duration(days: 1));
      }

      _scheduleNotification(scheduledTime);
    }
  }

  Future<void> _scheduleNotification(DateTime scheduledTime) async {
    print('예약 알림 버튼 클릭됨 - $scheduledTime');
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            importance: Importance.high, priority: Priority.high);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      '예약된 알림',
      '사용자가 선택한 시간에 울리는 알림입니다!',
      tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
    print('예약된 알림 요청 실행됨 - $scheduledTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showNotification,
              child: const Text('즉시 알림 보내기'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickTimeAndScheduleNotification,
              child: const Text('알림 시간 선택'),
            ),
          ],
        ),
      ),
    );
  }
}
