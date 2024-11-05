import 'dart:io';

import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [ScheduleTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<ScheduleTableData>> getSchedules(
    DateTime date,
  ) =>
      (select(scheduleTable)..where((Table) => Table.date.equals(date))).get(); // get은 한번 반환 Future를 

  //return (select(scheduleTable)..where((Table)=> Table.date.equals(date))).get();
  // ↕ 같은 코드인데 간단하게 정리가 되고, 에로우 함수로 간결하게 더 편하게 코드 작성
  // final selectQuery = select(scheduleTable);
  // selectQuery.where((Table)=> Table.date.equals(date));
  // return selectQuery.get();

  Stream<List<ScheduleTableData>>streamSchedules(DateTime date,)=>
      (select(scheduleTable)..where((Table) => Table.date.equals(date))).watch(); //watch는 계속 반환 Stream을

  Future<int> createSchedule(ScheduleTableCompanion data) =>
      into(scheduleTable).insert(data);

  Future<int> Function() removeSchedule(int id) => (delete(scheduleTable)..where((table) => table.id.equals(id))).go;

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      final cachebase = await getTemporaryDirectory();
      sqlite3.tempDirectory = cachebase.path;

      return NativeDatabase.createBackgroundConnection(file);
    },
  );
}
