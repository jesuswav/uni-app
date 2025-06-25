import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';
import '../widgets/pendingTaskItem.dart'; // Asegúrate de importar correctamente

class Task {
  final String titulo;
  final String materia;
  final DateTime fechaEntrega;
  final String descripcion;
  final String teacher;

  Task({
    required this.titulo,
    required this.materia,
    required this.fechaEntrega,
    required this.descripcion,
    required this.teacher,
  });
}

final List<Task> tareasPendientes = [
  Task(
    titulo: 'Ensayo sobre la Revolución Mexicana',
    materia: 'Historia',
    fechaEntrega: DateTime.now().add(const Duration(days: 2)),
    teacher: 'Mtro. Pérez',
    descripcion:
        '''Redacta un ensayo de 2 cuartillas explicando las principales causas y consecuencias de la Revolución Mexicana. El documento debe incluir al menos tres fuentes bibliográficas.''',
  ),
  Task(
    titulo: 'Problemas de álgebra lineal',
    materia: 'Matemáticas',
    fechaEntrega: DateTime.now().add(const Duration(days: 1)),
    teacher: 'Mtro. Pérez',
    descripcion:
        '''Resuelve los problemas 5 al 12 del capítulo 3 del libro de texto. Justifica cada paso del procedimiento y entrega en PDF.''',
  ),
  Task(
    titulo: 'Presentación de ecosistemas',
    materia: 'Ciencias Naturales',
    fechaEntrega: DateTime.now().add(const Duration(days: 3)),
    teacher: 'Mtro. Pérez',
    descripcion:
        '''Prepara una presentación en equipo sobre los ecosistemas terrestres. Incluye imágenes, ejemplos de especies, y un análisis del impacto humano.''',
  ),
];

class PendingTasksPage extends StatelessWidget {
  const PendingTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas Pendientes'),
        backgroundColor: AppColors.background,
      ),
      body: ListView.builder(
        itemCount: tareasPendientes.length,
        itemBuilder: (context, index) {
          final tarea = tareasPendientes[index];
          return TaskItem(
            titulo: tarea.titulo,
            materia: tarea.materia,
            fechaEntrega: tarea.fechaEntrega,
            content: tarea.descripcion,
            teacher: tarea.teacher,
          );
        },
      ),
    );
  }
}
