import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imc/main.dart';



void main() {
  testWidgets('Exibe o título da calculadora de IMC', (WidgetTester tester) async {
    await tester.pumpWidget(CalculadoraIMCApp());

    // Verifica se o título esperado está presente
    expect(find.text('Calculadora de IMC'), findsOneWidget);
  });
}
