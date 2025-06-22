import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';
import '../widgets/scheduleItem.dart';

class Schedule {
  final String subject;
  final String teacher;
  final String startTime;
  final String finishTime;
  final String day;

  Schedule({
    required this.subject,
    required this.teacher,
    required this.startTime,
    required this.finishTime,
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
    day: 'Lunes',
  ),
  Schedule(
    subject: 'Español',
    teacher: 'Mtro. Pérez',
    startTime: '09:10am',
    finishTime: '10:10am',
    day: 'Lunes',
  ),

  // Martes
  Schedule(
    subject: 'Ciencias',
    teacher: 'Mtra. Gómez',
    startTime: '08:00am',
    finishTime: '09:00am',
    day: 'Martes',
  ),
  Schedule(
    subject: 'Historia',
    teacher: 'Mtro. Herrera',
    startTime: '09:10am',
    finishTime: '10:10am',
    day: 'Martes',
  ),

  // Miércoles
  Schedule(
    subject: 'Geografía',
    teacher: 'Mtra. Romero',
    startTime: '08:00am',
    finishTime: '09:00am',
    day: 'Miércoles',
  ),
  Schedule(
    subject: 'Educación Física',
    teacher: 'Profr. Silva',
    startTime: '09:10am',
    finishTime: '10:10am',
    day: 'Miércoles',
  ),

  // Jueves
  Schedule(
    subject: 'Inglés',
    teacher: 'Miss Clark',
    startTime: '08:00am',
    finishTime: '09:00am',
    day: 'Jueves',
  ),
  Schedule(
    subject: 'Computación',
    teacher: 'Ing. Torres',
    startTime: '09:10am',
    finishTime: '10:10am',
    day: 'Jueves',
  ),

  // Viernes
  Schedule(
    subject: 'Matemáticas',
    teacher: 'Mtra. López',
    startTime: '08:00am',
    finishTime: '09:00am',
    day: 'Viernes',
  ),
  Schedule(
    subject: 'Arte',
    teacher: 'Mtro. Díaz',
    startTime: '09:10am',
    finishTime: '10:10am',
    day: 'Viernes',
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

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: filteredSchedules.map((schedule) {
                        return ScheduleItem(
                          subject: schedule.subject,
                          teacher: schedule.teacher,
                          startTime: schedule.startTime,
                          finishTime: schedule.finishTime,
                          day: schedule.day,
                        );
                      }).toList(),
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
