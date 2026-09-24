import 'package:flutter_test/flutter_test.dart';

import 'package:pay_stash/main.dart';

void main() {
  testWidgets('La pantalla de inicio muestra el saldo disponible',
      (WidgetTester tester) async {
    // Construye la app y dispara un frame.
    await tester.pumpWidget(const PayStashApp());

    // Verifica que el texto del saldo aparezca en pantalla.
    expect(find.textContaining('Te quedan Q'), findsOneWidget);

    // Verifica que el botón de acceso al desglose exista.
    expect(find.text('Ver desglose por rubros'), findsOneWidget);
  });
}