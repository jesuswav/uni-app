import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';

class TaskScreen extends StatelessWidget {
  final String nombreTarea;
  final String nombreProfesor;
  final String contenidoTarea;

  const TaskScreen({
    super.key,
    required this.nombreTarea,
    required this.nombreProfesor,
    required this.contenidoTarea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entregar Tarea'),
        centerTitle: true,
        //backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // 👉 Contenido desplazable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre y profesor
                      Text(
                        nombreTarea,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Asignado por: $nombreProfesor',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 👉 Contenido de la tarea (texto largo con listas, saltos, etc.)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: SelectableText(
                          contenidoTarea,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // 👉 Botón para agregar documento
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // lógica para seleccionar documento
                  },
                  icon: const Icon(Icons.upload_file, color: AppColors.text75),
                  label: const Text(
                    'Agregar Documento',
                    style: TextStyle(color: AppColors.text75),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary300,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 👉 Botón para entregar tarea
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // lógica para entregar tarea
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Entregar Tarea',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
