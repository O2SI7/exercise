import 'dart:math';

import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/datebase/drift.dart';
import 'package:calendar_scheduler/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/calendar.dart';
import 'package:calendar_scheduler/const/color.dart';
import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  ///{
  ///  2023-11-23:[Schedule, Schedule],
  ///  2023-11-24:[Schedule, Schedule]
  ///}

  // Map<DateTime, List<ScheduleTable>> schedules = {
  //   DateTime.utc(2024, 3, 8): [
  //     ScheduleTable(
  //       id: 1,
  //       startTime: 11,
  //       endTime: 12,
  //       content: '얍',
  //       date: DateTime.utc(2024, 3, 8),
  //       color: categoryColors[0],
  //       createdAt: DateTime.now().toUtc(),
  //     ),
  //     ScheduleTable(
  //       id: 2,
  //       startTime: 13,
  //       endTime: 14,
  //       content: '얍diq',
  //       date: DateTime.utc(2024, 3, 8),
  //       color: categoryColors[3],
  //       createdAt: DateTime.now().toUtc(),
  //     ),
  //   ],

  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet<ScheduleTable>(
            context: context,
            builder: (_) {
              return ScheduleBottomSheet(
                selectedDay: selectedDay,
              );
            },
          );
        },
        backgroundColor: primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              focusedDay: DateTime(2024, 3, 1),
              onDaySelected: OnDaySelected,
              selectedDayPredicate: selectedDayPredicate,
            ),
            TodayBanner(
              selectedDay: selectedDay,
              taskCount: 0,
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                child: StreamBuilder<List<ScheduleTableData>>(
                    stream: GetIt.I<AppDatabase>().streamSchedules(
                      selectedDay,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                          ),
                        );
                      }
                      if (snapshot.data == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final schedules = snapshot.data!;

                      return ListView.separated(
                        itemCount: schedules.length,
                        itemBuilder: (BuildContext context, int index) {
                          ///선택된 날짜에 해당되는 일정 리스트로 저장
                          ///List<Schedule>
                          // final selectedSchedules = schedules[selectedDay]!;
                          // final scheduleModel = selectedSchedules[index];

                          final schedule = schedules[index];

                          return Dismissible(
                            key: ObjectKey(schedule.id),
                            direction: DismissDirection.endToStart,
                            // confirmDismiss: (DismissDirection direction) async {
                            //   await GetIt.I<AppDatabase>().removeSchedule(
                            //     schedule.id,
                            //   );

                            //   return true;
                            // },
                            onDismissed: (DismissDirection direction){
                              GetIt.I<AppDatabase>().removeSchedule(schedule.id,);
                            } ,
                            child: ScheduleCard(
                              startTime: schedule.startTime,
                              endTime: schedule.endTime,
                              content: schedule.content,
                              color: Color(
                                int.parse(
                                  'FF${schedule.color}',
                                  radix: 16,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8);
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void OnDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
    });
  }

  bool selectedDayPredicate(DateTime date) {
    if (selectedDay == null) {
      return false;
    }
    return date.isAtSameMomentAs(selectedDay!);
  }
}
