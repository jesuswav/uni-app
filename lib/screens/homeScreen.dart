import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';

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
                                    Row(
                                      children: [
                                        Text(
                                          "Nombre de la tarea",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " - ",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Text(
                                          "Nombre materia",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 4),

                                    Row(
                                      children: [
                                        Text(
                                          "Nombre de la tarea",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " - ",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        Text(
                                          "Nombre materia",
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 22),

                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        "Ver todas...",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
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
