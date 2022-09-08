import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Util.dart';
import 'gridview.dart';
import 'separated_usage.dart';
import 'bookRank.dart';
import 'bookRankScaffold.dart';
import 'demo/ViewpagerPage.dart';
import 'BookpagerPage.dart';
import 'bookDetailTitle.dart';
import 'demo/DemoOne.dart';
import 'BookDetailscorllview.dart';
import 'BookpagerPage2.dart';

import 'package:dio/dio.dart';

//主页
class WanAndroidApp extends StatefulWidget {
  @override
  _WanAndroidAppState createState() => _WanAndroidAppState();
}

class _WanAndroidAppState extends State<WanAndroidApp>
    with TickerProviderStateMixin {
  int _tabIndex = 0;

  late List<BottomNavigationBarItem> _navigationViews;

  var appBarTitles = ['Library', 'Discover', 'Ranking', 'Me'];

  var _body;


  /**
   * new BottomNavigationBarItem(
   *  icon: new Image.asset('images/1.0x/icon2.png')
   */

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SvgPicture bookshelf1 = new SvgPicture.asset(
      "image/bookshelf1.svg",
      width: 22,
      height: 22,
    );

    SvgPicture bookshelf2 = new SvgPicture.asset(
      "image/bookshelf2.svg",
      width: 22,
      height: 22,
    );

    SvgPicture find1 = new SvgPicture.asset(
      "image/find1.svg",
      width: 22,
      height: 22,
    );

    SvgPicture find2 = new SvgPicture.asset(
      "image/find2.svg",
      width: 22,
      height: 22,
    );

    SvgPicture me1= Utils.svg( "me1.svg", width: 22, height: 22);
    SvgPicture me2 = Utils.svg( "me2.svg", width: 22, height:22);

    SvgPicture ranking1 = new SvgPicture.asset(
      "image/ranking1.svg",
      width: 22,
      height: 22,
    );

    SvgPicture ranking2 = new SvgPicture.asset(
      "image/ranking2.svg",
      width: 22,
      height: 22,
    );

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitles[_tabIndex],
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () async{
                  // const platfrom=const MethodChannel("toJava");
                  // String returnValue = await platfrom.invokeMethod("张三");
                  // print("从原生Android的java方法返回的值是："+returnValue);
                  //
                  //
                  // const platfrom2=const MethodChannel("toJavaNum");
                  // String returnValue2 = await platfrom2.invokeMethod("张三");
                  // print("从原生Android的java方法返回的值是："+returnValue2);




                  getRequestFunction1();

                  navigatorKey.currentState!
                      .push(MaterialPageRoute(builder: (context) {
                    // return BookpagerPage();
                    return bookRankScaffold();
                  }));

                })
          ],
        ),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _tabIndex == 0 ? bookshelf2 : bookshelf1,
              label:appBarTitles[0],
            ),
            BottomNavigationBarItem(
              icon: _tabIndex == 1 ? find2 : find1,
              label: appBarTitles[1],
            ),
            BottomNavigationBarItem(
              icon: _tabIndex == 2 ? ranking2 : ranking1,
              label: appBarTitles[2],
            ),
            BottomNavigationBarItem(
              icon: _tabIndex == 3 ? me2 : me1,
              label: appBarTitles[3],
            ),
          ]
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
              print("wpf123  $_tabIndex");
            });
          },
        ),
      ),
    );
  }

  void getRequestFunction1() async {
    ///创建Dio对象
    Dio dio = new Dio();
    ///请求地址 获取用户列表
    String url = "https://10.0.3.166:8020/cm/api";
    // [{"event":"clientBehavior","behavior_id":"ccccc_10","timestamp":1662606826221},{"event":"clientBehavior","behavior_id":"ccccc_10","timestamp":1662604596424}]
    Map<String, dynamic> map = Map();
    map['event'] = "clientBehavior";
    map['behavior_id'] = "ccccc_10";
    map['timestamp'] = 1662606826221;
    print("/发起get请求");
    ///发起get请求
    Response response = await dio.post(url,data:map );
    ///响应数据
    var data = response.data.toString();
    print("请求结果 $data");

  }

}
