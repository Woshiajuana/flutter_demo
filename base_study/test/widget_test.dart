import 'package:flutter_test/flutter_test.dart';

import 'package:base_study/main.dart';

void main() {
  testWidgets('确认后跳转到 livepage', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('webview'), findsOneWidget);

    await tester.tap(find.text('webview'));
    await tester.pumpAndSettle();

    expect(find.text('提示'), findsOneWidget);
    expect(find.text('确认跳转到 livepage 页面吗？'), findsOneWidget);

    await tester.tap(find.text('确定'));
    await tester.pumpAndSettle();

    expect(find.text('Live Page'), findsOneWidget);
  });
}
