import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  testWidgets('Anime Detail View Test', (tester) async {
    const text = Text('Anime Name');
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(appBar: AppBar(title: text)),
      ),
    );
    final textWidget = find.byType(Text);

    expect(textWidget, findsOneWidget);
    expect(find.text('Anime Name'), findsOneWidget);
  });
}
