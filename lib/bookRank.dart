import 'package:flutter/material.dart';

import 'separated_usage.dart';
import 'gridview.dart';
class bookRank extends StatelessWidget {
  const bookRank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,//宽度挤满符容器
      height:  double.maxFinite,//高
      color: Colors.white,
       child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FriendList(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "分类",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 22,
                      color: Color(0xE6000000),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                Expanded(
                  flex: 1,
                  child: GridViewApp(),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
