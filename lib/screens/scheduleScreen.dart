import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';
import '../widgets/scheduleItem.dart';
import '../screens/classScreen.dart';

class Schedule {
  final String subject;
  final String teacher;
  final String startTime;
  final String finishTime;
  final String quarter;
  final int credits;
  final String description;
  final String day;

  Schedule({
    required this.subject,
    required this.teacher,
    required this.startTime,
    required this.finishTime,
    required this.quarter,
    required this.credits,
    required this.description,
    required this.day,
  });
}

final List<Schedule> semanalSchedule = [
  // Lunes
  Schedule(
    subject: 'Matemáticas',
    teacher: 'Mtra. López',
    startTime: '08:00am',
    finishTime: '09:00am',
    quarter: '5to',
    day: 'Lunes',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),
  Schedule(
    subject: 'Español',
    teacher: 'Mtro. Pérez',
    startTime: '09:10am',
    finishTime: '10:10am',
    quarter: '5to',
    day: 'Lunes',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),

  // Martes
  Schedule(
    subject: 'Ciencias',
    teacher: 'Mtra. Gómez',
    startTime: '08:00am',
    finishTime: '09:00am',
    quarter: '5to',
    day: 'Martes',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),
  Schedule(
    subject: 'Historia',
    teacher: 'Mtro. Herrera',
    startTime: '09:10am',
    finishTime: '10:10am',
    quarter: '5to',
    day: 'Martes',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),

  // Miércoles
  Schedule(
    subject: 'Geografía',
    teacher: 'Mtra. Romero',
    startTime: '08:00am',
    finishTime: '09:00am',
    quarter: '5to',
    day: 'Miércoles',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),
  Schedule(
    subject: 'Educación Física',
    teacher: 'Profr. Silva',
    startTime: '09:10am',
    finishTime: '10:10am',
    quarter: '5to',
    day: 'Miércoles',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),

  // Jueves
  Schedule(
    subject: 'Inglés',
    teacher: 'Miss Clark',
    startTime: '08:00am',
    finishTime: '09:00am',
    quarter: '5to',
    day: 'Jueves',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),
  Schedule(
    subject: 'Computación',
    teacher: 'Ing. Torres',
    startTime: '09:10am',
    finishTime: '10:10am',
    quarter: '5to',
    day: 'Jueves',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),

  // Viernes
  Schedule(
    subject: 'Matemáticas',
    teacher: 'Mtra. López',
    startTime: '08:00am',
    finishTime: '09:00am',
    quarter: '5to',
    day: 'Viernes',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),
  Schedule(
    subject: 'Arte',
    teacher: 'Mtro. Díaz',
    startTime: '09:10am',
    finishTime: '10:10am',
    quarter: '5to',
    day: 'Viernes',
    credits: 8,
    description:
        'Curso orientado a estructuras de datos avanzadas y paradigmas modernos.',
  ),
];

final List<String> days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'];

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String selectedDay = 'Lunes';
  List<Schedule> filteredSchedules = [];

  @override
  void initState() {
    super.initState();
    filteredSchedules = filtrarHorarios(selectedDay);
  }

  // 🔍 Función separada para filtrar
  List<Schedule> filtrarHorarios(String dia) {
    return semanalSchedule.where((h) => h.day == dia).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 18,
            right: 18,
            bottom: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '⏰ Horarios',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 34),

              // Menú desplegable
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDay,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200, // 🎨 Fondo
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // 🟦 Bordes redondeados
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: AppColors.text100,
                        width: 1.5,
                      ), // 🖋️ Borde activo
                    ),
                  ),
                  borderRadius: BorderRadius.circular(22),
                  dropdownColor:
                      AppColors.text75, // 🎨 Fondo del dropdown expandido
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey.shade700,
                  ), // 🔽 Icono de flecha
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ), // 🖋️ Estilo del texto
                  items: days.map((String dia) {
                    return DropdownMenuItem<String>(
                      value: dia,
                      child: Text(dia),
                    );
                  }).toList(),
                  onChanged: (String? nuevoDia) {
                    if (nuevoDia != null) {
                      setState(() {
                        selectedDay = nuevoDia;
                        filteredSchedules = filtrarHorarios(nuevoDia);
                      });
                    }
                  },
                ),
              ),

              SizedBox(height: 16),

              // Renderizar los elementos filtrados
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 400),
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeIn,
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                          child: Column(
                            key: ValueKey(
                              selectedDay,
                            ), // 👈 ¡clave para que funcione!
                            children: filteredSchedules.map((schedule) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ClassScreen(
                                        subject: Subject(
                                          nombre: schedule.subject,
                                          profesor: schedule.teacher,
                                          startTime: schedule.startTime,
                                          finishTime: schedule.finishTime,
                                          cuatrimestre: schedule.quarter,
                                          creditos: schedule.credits,
                                          descripcion: schedule.description,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ScheduleItem(
                                  subject: schedule.subject,
                                  teacher: schedule.teacher,
                                  startTime: schedule.startTime,
                                  finishTime: schedule.finishTime,
                                  day: schedule.day,
                                ),
                              );
                            }).toList(),
                          ),
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
