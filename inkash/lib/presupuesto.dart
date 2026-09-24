import 'package:flutter/material.dart';

import 'theme.dart';

class PresupuestoScreen extends StatelessWidget {
  const PresupuestoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Presupuesto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kSuperficie,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: kBorde),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Presupuesto mensual',
                    style: TextStyle(color: kMuted, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Q6,500.00',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.57,
                    color: kLima,
                    backgroundColor: kBorde,
                    minHeight: 8.0,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Q3,703.50 utilizado de Q6,500.00',
                    style: TextStyle(fontSize: 12, color: kMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Categorías',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            _categoriaItem(Icons.shopping_cart, 'Alimentos', 850, 1200),
            _categoriaItem(Icons.directions_bus, 'Transporte', 320, 500),
            _categoriaItem(Icons.bolt, 'Servicios', 580, 600),
            _categoriaItem(Icons.local_cafe, 'Entretenimiento', 210, 400),
          ],
        ),
      ),
    );
  }

  Widget _categoriaItem(
      IconData icon, String nombre, double gastado, double limite) {
    final porcentaje = gastado / limite;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kSuperficie,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: kBorde),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: kIconoFondo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: kLima, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(nombre, style: const TextStyle(fontSize: 15)),
              ),
              Text(
                'Q${gastado.toStringAsFixed(2)} / Q${limite.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12, color: kMuted),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: porcentaje,
            color: porcentaje > 0.9 ? Colors.redAccent : kLima,
            backgroundColor: kBorde,
            minHeight: 6,
          ),
        ],
      ),
    );
  }
}
