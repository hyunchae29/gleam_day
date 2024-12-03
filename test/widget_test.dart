import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gleam_day/main.dart'; // GleamDayApp이 정의된 파일 import

void main() {
  testWidgets('GleamDayApp widget test', (WidgetTester tester) async {
    // `hasSeenTutorial`과 `router` 인자를 추가하여 수정
    await tester.pumpWidget(GleamDayApp(hasSeenTutorial: false));

    // 추가적인 위젯 테스트 작성 가능
    expect(find.text('How\ndo you\nfeel\ntoday?'), findsOneWidget);
  });
}
