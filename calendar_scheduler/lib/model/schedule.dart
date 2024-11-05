import 'package:drift/drift.dart';

class ScheduleTable  extends Table{
  /// 1 식별 가능한 ID
  //final int id;
  IntColumn get id => integer().autoIncrement()();  // 자동으로 

  /// 2 시작 시간
  
  //final int startTime;
  IntColumn get startTime  => integer()();  //직접 입력 

  /// 3 종료 시간
  
  //final int endTime;
  IntColumn get endTime  => integer()(); 
  
  /// 4 일정 내용
  
  //final String content;
  TextColumn get content => text()();

  /// 5 날짜
  //final DateTime date;
  DateTimeColumn get date => dateTime()(); 

  /// 6 카테고리
  //final String color;
  TextColumn get color => text()();

  /// 7 일정 생성 날짜시간
  //final DateTime createdAt;
  DateTimeColumn get createdAt => dateTime().clientDefault(()=> DateTime.now().toUtc())(); 
  // utc time을 기본값으로 입력하게 한다.언제? 로우가 생성 될 때 마다, 생성되는 순간의 시간, 날짜 ,시간을 자동으로 생성

  // Schedule({
  //   required this.id,
  //   required this.startTime,
  //   required this.endTime,
  //   required this.content,
  //   required this.date,
  //   required this.color,
  //   required this.createdAt,
  // });
}
