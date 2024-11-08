import 'package:dio/dio.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class StatRepository {
  static Future<List<StatModel>> fetchData({
    required ItemCode itemCode,
  }) async {
    final itemCodeStr = itemCode == ItemCode.PM25 ? 'PM2.5' : itemCode.name;

    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey':
            'q7S6wsMxoPmzHHwxEvvd77gWvJhKqbtOPLHumyYyH6pxzaybEb9KQHMvMAv9/rV8pOegcNbJCH9bP7Y8YPmmLg==',
        'returnType': 'json',
        'numOfRows': 100,
        'pageNo': 1,
        'itemCode': itemCodeStr,
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      },
    );

    final rawItemList = response.data['response']['body']['items'];

    List<StatModel> stats = [];

    final List<String> skipKeys = [
      'dataGubun',
      'dataTime',
      'itemCode',
    ];

    for (Map<String, dynamic> item in rawItemList) {
      final dateTime = item['dataTime'];

      for (String key in item.keys) {
        if (skipKeys.contains(key)) {
          continue;
        }
        final regionStr = key;
        final stat = item['regionStr'];

        final statModel = StatModel()
          ..region = Region.values.firstWhere((e) => e.name == regionStr)
          ..stat = double.parse(stat)
          ..dateTime = DateTime.parse(dateTime)
          ..itemCode = itemCode;

        final isar = GetIt.I<Isar>();

        await isar.writeTxn(
          () async {
            await isar.statModels.put(statModel);
          },
        );

        // stats = [
        //   ...stats,
        //   StatModel(
        //     // 키 값이 대구 -> 이런식으로 쓴다. (값을 넣어준다)
        //     //key: 'daegu' -> Region.daegu
        //     region: Region.values.firstWhere((e) => e.name == regionStr),
        //     stat: double.parse(stat),
        //     dateTime: DateTime.parse(dateTime),
        //     itemCode: itemCode,
        //   )
        // ];
      }
    }

    return stats;
  }
}
