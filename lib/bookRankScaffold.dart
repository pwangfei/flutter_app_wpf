import 'package:flutter/material.dart';

import 'friend_card.dart';
import 'bookRank.dart';

class bookRankScaffold extends StatelessWidget {
  const bookRankScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        //默认是4， 设置成0 就是没有阴影了
        automaticallyImplyLeading: false,
        title: Text(
          "小说榜",
          style: TextStyle(color: Color(0xE6000000)),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Color(0xE6000000),
              onPressed: () {})
        ],
      ),
      body: bookRank(),
    );
  }
}
