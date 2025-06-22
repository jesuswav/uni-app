import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap; // función recibida desde el componente padre

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18), // 👈 border radius aquí
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 32, right: 32, bottom: 24),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(28),
          color: AppColors.primary500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
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
                  icon: Icons.schedule,
                  label: 'Horarios',
                  selected: selectedIndex == 1,
                  onTap: () => onTap(1),
                ),
                SizedBox(width: 16),
                _NavItem(
                  icon: Icons.person,
                  label: 'Perfil',
                  selected: selectedIndex == 2,
                  onTap: () => onTap(2),
                ),
              ],
            ),
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
          Icon(
            icon,
            color: selected ? Colors.white : AppColors.text50,
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.white : AppColors.text50,
            ),
          ),
        ],
      ),
    );
  }
}
