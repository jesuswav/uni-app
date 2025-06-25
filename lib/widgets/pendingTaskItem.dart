import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/taskScreen.dart';

class TaskItem extends StatelessWidget {
  final String titulo;
  final String materia;
  final DateTime fechaEntrega;
  final String teacher;
  final String content;

  const TaskItem({
    super.key,
    required this.titulo,
    required this.materia,
    required this.fechaEntrega,
    required this.teacher,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final formatoFecha = DateFormat('dd MMM yyyy – HH:mm');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TaskScreen(
              nombreTarea: titulo,
              nombreProfesor: teacher,
              contenidoTarea: content,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.book, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  materia,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Entrega: ${formatoFecha.format(fechaEntrega)}',
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
