import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/main.dart';

void main() {
  testWidgets('Shop App displays title test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Shop App'), findsOneWidget);
  });
}
