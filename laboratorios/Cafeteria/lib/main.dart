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
class Producto {
  final String nombre;
  final double precio;
  const Producto(this.nombre, this.precio);
}

class PantallaPedido extends StatelessWidget {
  const PantallaPedido({super.key});

  static const List<Producto> _productos = [
    Producto('Café', 10.00),
    Producto('Sándwich', 25.00),
    Producto('Jugo', 12.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi pedido'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _productos.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                return ProductoPedido(
                  nombre: _productos[i].nombre,
                  precio: _productos[i].precio,
                  cantidad: 0,
                  onAgregar: () {},
                  onQuitar: () {},
                );
              },
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

/// Fila reutilizable: recibe los datos y las acciones como parámetros.
class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback onAgregar;
  final VoidCallback onQuitar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.onAgregar,
    required this.onQuitar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'Q${precio.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton.outlined(
            onPressed: onQuitar,
            icon: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$cantidad',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton.outlined(
            onPressed: onAgregar,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}