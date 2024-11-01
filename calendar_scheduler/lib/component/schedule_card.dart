import 'package:calendar_scheduler/const/color.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;
  final Color color;

  const ScheduleCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          //IntrinsicHeight https://jake-seo-dev.tistory.com/660
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //1 -> 01
                    //10 ->00
                    //padLeft
                    '${startTime.toString().padLeft(2 ,'0')}:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${endTime.toString().padLeft(2 ,'0')}:00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(content),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
