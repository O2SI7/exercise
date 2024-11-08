import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utills/date_utills.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class MainStat extends StatelessWidget {
  const MainStat({super.key});

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 40,
    );

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: FutureBuilder<StatModel?>(
            future: GetIt.I<Isar>()
                .statModels
                .filter()
                .regionEqualTo(Region.seoul)
                .itemCodeEqualTo(ItemCode.PM10)
                .findFirst(),
            builder: (context, snapshot) {
              if (!snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Text('데이터가 없습니다.'),
                );
              }

              final statModel = snapshot.data!;

              return Column(
                children: [
                  Text(
                    '서울',
                    style: ts.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    DateUtills.DateTimeToString(
                      dateTime: statModel.dateTime,
                    ),
                    style: ts.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'asset/img/good.png',
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '보통',
                    style: ts.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '나쁘지 않네요!',
                    style: ts.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
