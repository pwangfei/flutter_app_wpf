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
import 'demo/PropertyData.dart';
import 'demo/RepoerData.dart';
import 'demo/BuriedData.dart';
import 'dart:convert' as convert;


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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




                  // getRequestFunction1();
                  openSqlite();

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

  }


  void getRequestFunction2() async {
    ///创建Dio对象
    Dio dio = new Dio();
    ///请求地址 获取用户列表
    String url = "https://www.wanandroid.com/tree/json";
    ///发起get请求
    Response response = await dio.get(url);
    ///响应数据
    var data = response.data.toString();
    print("请求结果 $data");


  }



  void getRequestFunction3() async {
    String url = "https://www.wanandroid.com/user/login";
    ///创建Dio
    Dio dio = new Dio();
    ///创建Map 封装参数
    Map<String,dynamic> map = Map();
    map['username']="admin";
    map['password']="123456";
    ///发起post请求
    Response response =  await dio.post(url,data: {"username":"admin","password":"123456"});
    var data = response.data.toString();
    print("请求结果 $data");


  }

  void openSqlite() async {

    // 获取数据库 的位置
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print("数据库的位置 $path");

    // 删除数据库
    // await deleteDatabase(path);

    // 打开数据库
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 创建数据库时，创建表
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });


    // 在事务中插入一些记录
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });


    // 更新一些记录
    int count = await database.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');


    // 获取记录
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);

    // assert(const DeepCollectionEquality().equals(list, expectedList));

    // 计算记录
    var count1 = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
    assert(count1 == 2);

    // Delete a record
    count = await database
        .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    assert(count == 1);

    //关闭数据库
    await database.close();

  }
}
