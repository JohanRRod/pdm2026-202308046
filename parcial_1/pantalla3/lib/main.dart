import 'package:flutter/material.dart';

void main() {
  runApp(const NeobankApp());
}

class NeobankApp extends StatelessWidget {
  const NeobankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neobank - Perfil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  
  static const Color accentGreen = Color(0xFFD6FF3F);
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color greyText = Color(0xFF8A8A8A);
  static const Color cardGrey = Color(0xFFF5F5F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    _buildTitle(),
                    const SizedBox(height: 24),
                    _buildAvatar(),
                    const SizedBox(height: 28),
                    _buildPersonalInfoSection(),
                    const SizedBox(height: 24),
                    _buildAccountInfoSection(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTitle() {
    return const Center(
      child: Text(
        'Perfil del Usuario',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: darkText,
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cardGrey,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: const Icon(Icons.person, size: 52, color: greyText),
          ),
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: darkText,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.edit, size: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionHeader('Información Personal', showEdit: true),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: cardGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            children: [
              _infoTile(
                icon: Icons.person_outline,
                label: 'Nombre',
                value: 'Johan Mendez',
              ),
              _divider(),
              _infoTile(
                icon: Icons.email_outlined,
                label: 'E-mail',
                value: 'jmendez@umes.edu.gt',
              ),
              _divider(),
              _infoTile(
                icon: Icons.phone_outlined,
                label: 'Numero de telefono',
                value: '+502 ****-****',
              ),
              _divider(),
              _infoTile(
                icon: Icons.home_outlined,
                label: 'Dirección',
                value: 'Quetzaltenango, Guatemala',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _sectionHeader('Información de cuenta', showEdit: false),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: cardGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            children: [
              _infoTile(
                icon: Icons.badge_outlined,
                label: 'Tipo de cuenta',
                value: 'Personal',
              ),
              _divider(),
              _infoTile(
                icon: Icons.tag_outlined,
                label: 'Numero de cuenta',
                value: '**** **** 4568',
              ),
              _divider(),
              _infoTile(
                icon: Icons.security_outlined,
                label: 'Seguridad',
                value: 'Face ID Activado',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionHeader(String title, {required bool showEdit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: darkText,
          ),
        ),
        if (showEdit)
          const Text(
            'Edit',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: greyText,
            ),
          ),
      ],
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: darkText),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: greyText),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: darkText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 14,
      endIndent: 14,
      color: Colors.grey.shade200,
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, active: false),
            _navItem(Icons.map_outlined, active: false),
            _navItem(Icons.swap_horiz, active: false),
            _navItem(Icons.settings_outlined, active: false),
            _navItem(Icons.person, active: true),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, {required bool active}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: active ? accentGreen : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 22,
        color: active ? darkText : greyText,
      ),
    );
  }
}