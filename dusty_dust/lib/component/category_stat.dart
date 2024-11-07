import 'package:dusty_dust/const/color.dart';
import 'package:flutter/material.dart';

class CategoryStat extends StatelessWidget {
  const CategoryStat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '종류별 통계',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: ListView(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: constraint.maxWidth / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('미세먼지'),
                              SizedBox(
                                height: 8,
                              ),
                              Image.asset(
                                'asset/img/bad.png',
                                width: 50,
                              ),
                              Text('46.0'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
