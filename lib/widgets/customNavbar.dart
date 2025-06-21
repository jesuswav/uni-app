import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap; // función recibida desde el componente padre

  const CustomNavBar({super.key, 
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min, // 🔹 Se adapta al contenido
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: Icons.home,
                label: 'Inicio',
                selected: selectedIndex == 0,
                onTap: () => onTap(0),
              ),
              SizedBox(width: 16),
              _NavItem(
                icon: Icons.person,
                label: 'Perfil',
                selected: selectedIndex == 1,
                onTap: () => onTap(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔹 Ajuste vertical exacto
        children: [
          Icon(icon, color: selected ? Colors.blue : Colors.grey, size: 28),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.blue : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}