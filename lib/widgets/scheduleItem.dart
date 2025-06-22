import 'package:flutter/material.dart';
import 'package:uni_app/core/theme.dart';

class ScheduleItem extends StatelessWidget {
  final String subject;
  final String teacher;
  final String startTime;
  final String finishTime;
  final String day;

  const ScheduleItem({
    required this.subject,
    required this.teacher,
    required this.startTime,
    required this.finishTime,
    required this.day,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.text50,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('📚', style: TextStyle(fontSize: 32)),
              SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1),
                  SizedBox(child: Text(teacher, textAlign: TextAlign.left)),
                ],
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    startTime,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0),
                  Text('a'),
                  SizedBox(height: 0),
                  Text(
                    finishTime,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
