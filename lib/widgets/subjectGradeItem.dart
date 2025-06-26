// widgets/subject_grade_item.dart
import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';
import '../models/subjectNotes.dart';

class SubjectGradeItem extends StatefulWidget {
  final SubjectNotes subjectNotes;

  const SubjectGradeItem({super.key, required this.subjectNotes});

  @override
  State<SubjectGradeItem> createState() => _SubjectGradeItemState();
}

class _SubjectGradeItemState extends State<SubjectGradeItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.text75,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        onTap: () => setState(() => isExpanded = !isExpanded),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título + icono de desplegar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nombre de la materia y profesor
                  Row(
                    children: [
                      Icon(Icons.class_, size: 38, color: AppColors.text100),

                      SizedBox(width: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.subjectNotes.subject,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.subjectNotes.teacher,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 28,
                    color: AppColors.text100,
                  ),
                ],
              ),

              // Calificaciones por unidad (expandible)
              if (isExpanded) ...[
                const SizedBox(height: 12),
                Column(
                  children: widget.subjectNotes.units.map((unit) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(unit.unitName),
                          Text(
                            unit.note.toStringAsFixed(1),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
