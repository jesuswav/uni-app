// screens/grades_page.dart
import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';
import '../models/subjectNotes.dart';
import '../widgets/subjectGradeItem.dart';

class GradesScreen extends StatelessWidget {
  GradesScreen({super.key});

  final List<SubjectNotes> subjectNotesList = [
    SubjectNotes(
      subject: 'Principios de IA',
      teacher: 'Alondra Velasco',
      units: [
        Unit(unitName: 'Unidad 1', note: 9.4),
        Unit(unitName: 'Unidad 2', note: 8.8),
        Unit(unitName: 'Unidad 3', note: 9.2),
      ],
    ),
    SubjectNotes(
      subject: 'Matemáticas Discretas',
      teacher: 'Luis Mena',
      units: [
        Unit(unitName: 'Unidad 1', note: 8.5),
        Unit(unitName: 'Unidad 2', note: 9.1),
      ],
    ),
    SubjectNotes(
      subject: 'Redes de Computadoras',
      teacher: 'Karla Ibarra',
      units: [
        Unit(unitName: 'Unidad 1', note: 7.9),
        Unit(unitName: 'Unidad 2', note: 8.6),
        Unit(unitName: 'Unidad 3', note: 9.0),
        Unit(unitName: 'Unidad 4', note: 9.5),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calificaciones'),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: subjectNotesList
                .map((subject) => SubjectGradeItem(subjectNotes: subject))
                .toList(),
          ),
        ),
      ),
    );
  }
}
