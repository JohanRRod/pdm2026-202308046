import 'package:flutter/material.dart';

void main() {
  runApp(const MarcadorApp());
}

class MarcadorApp extends StatelessWidget {
  const MarcadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador Deportivo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  // Puntuaciones locales
  int _puntosEquipoA = 0;
  int _puntosEquipoB = 0;

  // Nombres de los equipos
  final String _nombreEquipoA = 'Equipo A';
  final String _nombreEquipoB = 'Equipo B';

  // Métodos para cambiar la puntuación asegurando el límite inferior de cero
  void _modificarPuntosA(int delta) {
    setState(() {
      _puntosEquipoA = (_puntosEquipoA + delta).clamp(0, 999);
    });
  }

  void _modificarPuntosB(int delta) {
    setState(() {
      _puntosEquipoB = (_puntosEquipoB + delta).clamp(0, 999);
    });
  }

  // Método para reiniciar el marcador
  void _reiniciar() {
    setState(() {
      _puntosEquipoA = 0;
      _puntosEquipoB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lógica para determinar el mensaje y los colores
    String mensajeResultado;
    Color colorCardA = Colors.grey.shade200;
    Color colorCardB = Colors.grey.shade200;
    Color colorTextoA = Colors.black;
    Color colorTextoB = Colors.black;

    if (_puntosEquipoA > _puntosEquipoB) {
      mensajeResultado = 'Va ganando $_nombreEquipoA';
      colorCardA = Colors.green.shade100;
      colorTextoA = Colors.green.shade900;
    } else if (_puntosEquipoB > _puntosEquipoA) {
      mensajeResultado = 'Va ganando $_nombreEquipoB';
      colorCardB = Colors.green.shade100;
      colorTextoB = Colors.green.shade900;
    } else {
      mensajeResultado = 'Empate';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador Deportivo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Secciones de los equipos en paralelo
            Row(
              children: [
                Expanded(
                  child: _buildTarjetaEquipo(
                    nombre: _nombreEquipoA,
                    puntos: _puntosEquipoA,
                    colorFondo: colorCardA,
                    colorTexto: colorTextoA,
                    onSumar: () => _modificarPuntosA(1),
                    onRestar: () => _modificarPuntosA(-1),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTarjetaEquipo(
                    nombre: _nombreEquipoB,
                    puntos: _puntosEquipoB,
                    colorFondo: colorCardB,
                    colorTexto: colorTextoB,
                    onSumar: () => _modificarPuntosB(1),
                    onRestar: () => _modificarPuntosB(-1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Mensaje de estado/resultado
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                mensajeResultado,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Botón para reiniciar
            ElevatedButton.icon(
              onPressed: _reiniciar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para construir la tarjeta de cada equipo
  Widget _buildTarjetaEquipo({
    required String nombre,
    required int puntos,
    required Color colorFondo,
    required Color colorTexto,
    required VoidCallback onSumar,
    required VoidCallback onRestar,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorTexto == Colors.black ? Colors.grey.shade400 : colorTexto,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            nombre,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$puntos',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: colorTexto,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: onRestar,
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(backgroundColor: Colors.redAccent),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: onSumar,
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(backgroundColor: Colors.greenAccent.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}