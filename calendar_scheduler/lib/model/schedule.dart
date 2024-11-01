class Schedule {
  /// 1 식별 가능한 ID
  final int id;

  /// 2 시작 시간
  final int startTime;

  /// 3 종료 시간
  final int endTime;

  /// 4 일정 내용
  final String content;

  /// 5 날짜
  final DateTime date;

  /// 6 카테고리
  final String color;

  /// 7 일정 생성 날짜시간
  final DateTime createdAt;

  Schedule({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.date,
    required this.color,
    required this.createdAt,
  });
}
