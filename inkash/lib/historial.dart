import 'package:flutter/material.dart';

import 'theme.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Historial',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _seccionMes('Julio 2026', [
              _movimiento(Icons.arrow_upward, 'Salario quincena', 'Ingreso',
                  '+ Q4,200.00', '15 Jul', true),
              _movimiento(Icons.directions_bus, 'Uber al trabajo', 'Transporte',
                  '- Q38.00', '14 Jul', false),
              _movimiento(Icons.shopping_cart, 'Súper La Torre', 'Alimentos',
                  '- Q285.50', '14 Jul', false),
              _movimiento(Icons.local_cafe, 'Café con Ana', 'Entretenimiento',
                  '- Q65.00', '13 Jul', false),
              _movimiento(Icons.bolt, 'Recibo de luz (EEGSA)', 'Servicios',
                  '- Q420.00', '10 Jul', false),
            ]),
            const SizedBox(height: 16),
            _seccionMes('Junio 2026', [
              _movimiento(Icons.arrow_upward, 'Salario quincena', 'Ingreso',
                  '+ Q4,200.00', '30 Jun', true),
              _movimiento(Icons.shopping_cart, 'Walmart', 'Alimentos',
                  '- Q542.30', '28 Jun', false),
              _movimiento(Icons.local_cafe, 'Starbucks', 'Entretenimiento',
                  '- Q89.00', '25 Jun', false),
              _movimiento(Icons.bolt, 'Recibo de luz (EEGSA)', 'Servicios',
                  '- Q395.00', '20 Jun', false),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _seccionMes(String titulo, List<Widget> movimientos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 16, color: kMuted),
        ),
        const SizedBox(height: 8),
        ...movimientos,
      ],
    );
  }

  Widget _movimiento(IconData icon, String titulo, String categoria,
      String monto, String fecha, bool esIngreso) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kSuperficie,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorde),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kIconoFondo,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kLima, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontSize: 14)),
                Text(categoria,
                    style: const TextStyle(fontSize: 11, color: kMuted)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                monto,
                style: TextStyle(
                    fontSize: 13,
                    color: esIngreso ? kLima : kTexto,
                    fontWeight: FontWeight.w500),
              ),
              Text(fecha, style: const TextStyle(fontSize: 10, color: kMuted)),
            ],
          ),
        ],
      ),
    );
  }
}
