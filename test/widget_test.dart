import 'package:stateless_lab_exam/shopping_cart_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets('Shopping cart page displays correctly', (tester) async {
    await tester.pumpWidget(const CampusStoreApp());

    expect(find.text('My Cart'), findsOneWidget);
    expect(find.text('Ready for checkout'), findsOneWidget);
    expect(find.text('Order Items'), findsOneWidget);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.byType(ShoppingCartPage), findsOneWidget);
  });
}
