import 'package:flutter/material.dart';

import 'friend_card.dart';
import 'bookDetailTitle.dart';
import 'BookDetailscorllview.dart';

class BookpagerPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  // TODO: implement createState
  return _ApplicationPageState();
  }

}
class _ApplicationPageState extends State<BookpagerPage2> {

  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
      new AppBar(
        title: new Text("我是AppBar"),
        centerTitle: true,
      ),
      body: new PageView.builder(
        onPageChanged:_pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context,int index){

          return NestedScrollViewDemoTwo();
        },
        itemCount: 5,
      ),
    );
  }


  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

}
