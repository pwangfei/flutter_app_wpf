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
    String url = "http://10.0.3.166:8020/cm/api";

    // String url = "https://www.wanandroid.com/user/login";

    print("/发起get请求");
    ///发起get请求
    Response response = await dio.post(url,data: {"app_id":"10019","timestamp":"1662634482828","source":"1","nonce_str":"Ylni0ANX1HFvrpPH","data":[{"event":"interact_launch","mcc":460,"mnc":0,"timestamp":"1662633456440"}],"property":{"os":1,"device_id":"f62b56dcfa524384a86592b52eb46360","guid":"f62b56dc-fa52-4384-a865-92b52eb46360","user_id":"1234","ip":"","device_model":"xiaomi redmi note 8","brand":"xiaomi","carrier":"","sys_lang":"zh_CN","network_type":null,"app_lang":"en","sys_version":"28","app_version":"10","screen_width":1080,"screen_height":2130,"memory":"3.56","storage":"48.94","channel":"","package_name":"com.appsinnova.android.note"},"sign_type":"md5","sign":"F5A1A31B5981C449D516C63E3D3AFC5A"});
    ///响应数据
    var data = response.data.toString();
    print("请求结果 $data");

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



}
