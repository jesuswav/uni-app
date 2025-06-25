// models/unit.dart
class Unit {
  final String unitName;
  final double note;

  Unit({required this.unitName, required this.note});
}

// models/subject_notes.dart

class SubjectNotes {
  final String subject;
  final String teacher;
  final List<Unit> units;

  SubjectNotes({
    required this.subject,
    required this.teacher,
    required this.units,
  });
}
