import 'package:flutter/material.dart';

import 'theme.dart';

class AjustesScreen extends StatelessWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Ajustes',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _perfil(),
            const SizedBox(height: 24),
            _seccion('General', [
              _opcion(Icons.notifications_outlined, 'Notificaciones', true),
              _opcion(Icons.language, 'Idioma', false, valor: 'Español'),
              _opcion(Icons.attach_money, 'Moneda', false, valor: 'GTQ (Q)'),
            ]),
            const SizedBox(height: 16),
            _seccion('Seguridad', [
              _opcion(Icons.lock_outline, 'Cambiar contraseña', false),
              _opcion(Icons.fingerprint, 'Biometría', true),
            ]),
            const SizedBox(height: 16),
            _seccion('Cuenta', [
              _opcion(Icons.download_outlined, 'Exportar datos', false),
              _opcion(Icons.help_outline, 'Ayuda', false),
              _opcion(Icons.info_outline, 'Acerca de Inkash', false,
                  valor: 'v1.0.0'),
            ]),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _perfil() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSuperficie,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: kBorde),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: kIconoFondo,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: kLima, size: 30),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kevin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                'kevin@ejemplo.com',
                style: TextStyle(fontSize: 13, color: kMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _seccion(String titulo, List<Widget> opciones) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 13, color: kMuted),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: kSuperficie,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: kBorde),
          ),
          child: Column(children: opciones),
        ),
      ],
    );
  }

  Widget _opcion(IconData icon, String titulo, bool esSwitch,
      {String? valor}) {
    return ListTile(
      leading: Icon(icon, color: kTexto, size: 22),
      title: Text(titulo, style: const TextStyle(fontSize: 15)),
      trailing: esSwitch
          ? Switch(
              value: true,
              onChanged: (v) {},
              activeThumbColor: kLima,
            )
          : valor != null
              ? Text(valor, style: const TextStyle(fontSize: 13, color: kMuted))
              : const Icon(Icons.chevron_right, color: kMuted, size: 22),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: kBorde, width: 0.5),
      ),
    );
  }
}
