import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';

void main() {
  runApp(const PayStashApp());
}

/// Punto de entrada de pay_stash.
class PayStashApp extends StatelessWidget {
  const PayStashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pay_stash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.black87,
      ),
      home: const PantallaInicio(),
    );
  }
}