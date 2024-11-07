import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  //최대 높이
  double get maxExtent => maxHeight;

  @override
  //최소 높이
  double get minExtent => minHeight;

  @override
  //covariant - 상속된 클래스도 사용가능
  //oldDelegate - build가 실행이 됐을때 이전  Delegate
  //this는 항상 새로운 delegate
  //shouldRebuild - 새로 build를 해야할지 말지 결정
  //false - build 안함 , true - build 다시 함

  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderHeader(),
          renderBuilderSliverList(),
          renderHeader(),
          renderSliverGridBuilder(),
          renderHeader(),
          renderSliverGridBuilder(),
        ],
      ),
    );
  }

  //AppBar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      //floating: true => 스크롤 했을때 중간에 스크롤을 위로 하면 앱바가 나옴. 그리고 기본값은 false
      floating: true,
      //앱바를 고정시켜줌. 기본값은 false
      pinned: false,
      //자석 효과, floating이 true에만 사용가능
      snap: false,
      //맨 위에서 한계 이상으로 스크롤 했을 시, 남는 공간을 차지 ios에서 android는 physics를 사용하여 해야함.
      stretch: true,
      //늘어났을때 최대 사이즈
      expandedHeight: 200,
      //닫혀있다, 늘어나있다. 앱바를 닫을때 훨씬 빨리 밀려 들어간다.
      collapsedHeight: 150,
      //FlexibleSpaceBar 위젯을 넣어서 다른 위젯을 추가해서 나타 낼 수 있다. 글자는 맨 밑에 나옴.
      //expandedHeight로 공간을 차지하면 그만큼 확장됨.
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'asset/wak.jpg',
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'),
      ),
      title: Text('CustomScreenViewScreen'),
    );
  }

  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'eeeeeeeeee',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        minHeight: 100,
        maxHeight: 150,
      ),
    );
  }

  //ListView 기본 생성자와 유사함
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e),
            )
            .toList(),
      ),
    );
  }

  //ListView.builder 생성자와 유사함
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 50,
      ),
    );
  }

  //GridView.count 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e),
            )
            .toList(),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  //GridView.builder 와 비슷함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 50,
      ),
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      key: Key(index.toString()),
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
