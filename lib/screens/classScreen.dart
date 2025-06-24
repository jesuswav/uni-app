// screens/detalle_clase_screen.dart
import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {
  final String nombreClase;
  final String horario;

  const ClassScreen({
    super.key,
    required this.nombreClase,
    required this.horario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de clase')),
      body: Center(child: Text('$nombreClase - $horario')),
    );
  }
}
