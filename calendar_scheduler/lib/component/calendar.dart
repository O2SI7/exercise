import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_scheduler/const/color.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  const Calendar({super.key,
  required this.focusedDay,
  required this.onDaySelected,
  required this.selectedDayPredicate,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: Colors.grey[200]!,
        width: 1,
      ),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w500,
    );

    return TableCalendar(
          locale:'ko_KR',// 언어 번역 
          focusedDay: focusedDay,
          firstDay: DateTime(1800),
          lastDay: DateTime(3000),
          headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true, //오늘의 하이라이트
            defaultDecoration: defaultBoxDecoration,
            weekendDecoration: defaultBoxDecoration,
            selectedDecoration: defaultBoxDecoration.copyWith(
              border: Border.all(
                color: primaryColor,
                width: 1,
              ),
            ),
            todayDecoration: defaultBoxDecoration.copyWith(color: primaryColor),
            outsideDecoration: defaultBoxDecoration.copyWith(
              border: Border.all(color: Colors.transparent)
            ),
            defaultTextStyle: defaultTextStyle,
            weekendTextStyle: defaultTextStyle,
            selectedTextStyle: defaultTextStyle.copyWith(color: primaryColor),
          ),
          onDaySelected: onDaySelected ,
          selectedDayPredicate: selectedDayPredicate ,
        );
  }
}