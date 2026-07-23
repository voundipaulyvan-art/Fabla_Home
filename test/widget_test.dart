import 'package:flutter_test/flutter_test.dart';
import 'package:fabla_home/main.dart';

void main() {
  testWidgets('FablaHomeApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FablaHomeApp());
    expect(find.byType(FablaHomeApp), findsOneWidget);
  });
}
