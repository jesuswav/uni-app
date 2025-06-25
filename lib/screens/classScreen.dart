import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';

class Subject {
  final String nombre;
  final String profesor;
  final String startTime;
  final String finishTime;
  final String cuatrimestre;
  final int creditos;
  final String descripcion;

  Subject({
    required this.nombre,
    required this.profesor,
    required this.startTime,
    required this.finishTime,
    required this.cuatrimestre,
    required this.creditos,
    required this.descripcion,
  });
}

class ClassScreen extends StatelessWidget {
  final Subject subject;

  const ClassScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.nombre),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono principal y nombre
            Row(
              children: [
                const Icon(
                  Icons.book_outlined,
                  size: 40,
                  color: AppColors.primary100,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    subject.nombre,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Profesor
            Row(
              children: [
                const Icon(Icons.person_outline, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  'Profesor: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Flexible(child: Text(subject.profesor)),
              ],
            ),
            const SizedBox(height: 12),

            // Horario
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  'Horario: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Flexible(child: Text(subject.startTime)),
                Flexible(child: Text(subject.finishTime)),
              ],
            ),
            const SizedBox(height: 12),

            // Cuatrimestre
            Row(
              children: [
                const Icon(Icons.date_range_outlined, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  'Cuatrimestre: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(subject.cuatrimestre),
              ],
            ),
            const SizedBox(height: 12),

            // Créditos
            Row(
              children: [
                const Icon(Icons.grade_outlined, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  'Créditos: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text('${subject.creditos}'),
              ],
            ),
            const SizedBox(height: 20),

            // Descripción
            const Text(
              'Descripción',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(subject.descripcion, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
