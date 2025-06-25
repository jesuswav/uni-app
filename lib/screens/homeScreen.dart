import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';
import '../screens/taskScreen.dart';
import '../screens/pendingTaskScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 👈 Aquí envolvemos todo en un SafeArea
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 18,
            right: 18,
            bottom: 0,
          ), // 👈 Margen global
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '🏠 Home',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Centro de control',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Columna izquierda: dos elementos uno arriba del otro
                                Row(
                                  children: [
                                    Expanded(
                                      // Primer bloque
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 32,
                                          horizontal: 22,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.text50,
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Título A",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Subtítulo A",
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      // Primer bloque
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 32,
                                          horizontal: 22,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.text50,
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Título A",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Subtítulo A",
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12),

                                // Columna derecha: un solo elemento que ocupa las dos filas
                                Expanded(
                                  // Primer bloque
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 32,
                                      horizontal: 22,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.text50,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Título A",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Subtítulo A",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 22),

                        Row(
                          children: [
                            Text(
                              'Tareas Pendientes',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              // Primer bloque
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 32,
                                  horizontal: 22,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.text50,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TaskItem(
                                      subjectName: 'Integradora II',
                                      taskTeacher: 'Mtro. López',
                                      taskName: 'Investigación IoT',
                                    ),

                                    SizedBox(height: 4),

                                    TaskItem(
                                      subjectName: 'Integradora III',
                                      taskTeacher: 'Mtro. López',
                                      taskName:
                                          'Investigación en el campo de la exoplanetancia',
                                    ),

                                    SizedBox(height: 22),

                                    SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  PendingTasksPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Ver todas...",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.taskName,
    required this.taskTeacher,
    required this.subjectName,
    super.key,
  });

  final String taskName;
  final String taskTeacher;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TaskScreen(
              nombreTarea: taskName,
              nombreProfesor: taskTeacher,
              contenidoTarea: '''
1. Introducción a la Inteligencia Artificial
2. Historia cronológica:
   - 1956: Dartmouth Conference
   - 1980s: Expert systems
   - 2010s: Deep Learning
3. Aplicaciones actuales
4. Conclusión

*Este ensayo debe contener al menos 1000 palabras y ser entregado en PDF.*
''',
            ),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            // 👈 importante para que el texto se adapte
            child: Text(
              taskName,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(" - ", style: TextStyle(color: Colors.grey[700])),
          Text(
            subjectName,
            softWrap: true,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
