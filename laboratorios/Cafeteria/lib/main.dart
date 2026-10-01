import 'package:flutter/material.dart';

void main() => runApp(const MiPedidoApp());

class MiPedidoApp extends StatelessWidget {
  const MiPedidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi pedido',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const PantallaPedido(),
    );
  }
}

class PantallaPedido extends StatelessWidget {
  const PantallaPedido({super.key});

  Widget _fila(String nombre, String precio) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(precio,
                    style: const TextStyle(fontSize: 15, color: Colors.white70)),
              ],
            ),
          ),
          IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.remove)),
          const SizedBox(
            width: 40,
            child: Text('0',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi pedido'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _fila('Café', 'Q10.00'),
                const Divider(height: 1),
                _fila('Sándwich', 'Q25.00'),
                const Divider(height: 1),
                _fila('Jugo', 'Q12.00'),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Q0.00',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Vaciar pedido'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}