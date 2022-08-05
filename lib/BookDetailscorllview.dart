import 'package:flutter/material.dart';
import 'DetailSameBook.dart';

class NestedScrollViewDemoTwo extends StatefulWidget {
  const NestedScrollViewDemoTwo({Key? key}) : super(key: key);
  @override
  _DemoTwoPageState createState() =>_DemoTwoPageState();

}

class _DemoTwoPageState extends State<NestedScrollViewDemoTwo>  {


  @override
  void initState() {

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Column(children: <Widget>[
        Text(
          "Cassidy is a seventeen year old girl who starts falling for her boy best friends older brother, Alexander. Alexander is twenty five years old. He has dark black hair, pale skin and beautiful blue eyes. Unlike his younger brother, Max, Alexander was studying and was a good boy where Max is twenty years old. Max is Cassidy's best friend. Max has dark brown hair and hazel eyes with pale skin, tattoos and piercings. Little did she know, both brothers were both madly in love with her. This story is a love triangle between the three. May the best man win! Will Cassidy choose the good boy, or the bad boy?",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 14,
            color: Color(0xB3000000),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 26)),
        Container(
          height: 50,
          decoration: new BoxDecoration(
            border: new Border.all(color: Color(0x1A000000), width: 0.5),
            borderRadius: new BorderRadius.circular((30.0)),
          ),
          child: Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20)),
            Image.asset("image/classification.png", width: 22, height: 22),
            Padding(padding: EdgeInsets.only(left: 16)),
            Text(
              "201Chapters",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xE6000000),
              ),
            ),
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 14)),
        Container(
          height: 50,
          decoration: new BoxDecoration(
            border: new Border.all(color: Color(0x1A000000), width: 0.5),
            borderRadius: new BorderRadius.circular((30.0)),
          ),
          child: Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20)),
            Text(
              "礼物榜",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xE6000000),
              ),
            ),
            Expanded(child: SizedBox()), //自动扩展挤压
            Container(
              width: 74,
              child: Stack(
                  alignment: Alignment.center,
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Positioned(
                      left: 0.0,
                      child: ClipOval(
                        child: Image.network(
                          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 23.0,
                      child: ClipOval(
                        child: Image.network(
                          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 46.0,
                      child: ClipOval(
                        child: Image.network(
                          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(padding: EdgeInsets.only(right: 12)),
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 50)),
        Container(
          child: Row(children: <Widget>[
            ClipOval(
                child: Image.network(
                  "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                  width: 28,
                  height: 28,
                )),
            Padding(padding: EdgeInsets.only(left: 12)),
            Text(
              "Peter",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Color(0xE6000000),
              ),
            ),
            Expanded(child: SizedBox()), //自动扩展挤压
            Text(
              "6部作品",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 12,
                color: Color(0x80000000),
              ),
            ),
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal, //设置为横向，默认使纵向
            itemCount: authorList.length,
            itemBuilder: (context, index) {
              return DetailSameBook(data: authorList[index]);
            },
            separatorBuilder: (context, index) {
              return VerticalDivider(
                width: 16.0,
                color: Color(0xFFFFFFFF),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal, //设置为横向，默认使纵向
            itemCount: authorList.length,
            itemBuilder: (context, index) {
              return DetailSameBook(data: authorList[index]);
            },
            separatorBuilder: (context, index) {
              return VerticalDivider(
                width: 16.0,
                color: Color(0xFFFFFFFF),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal, //设置为横向，默认使纵向
            itemCount: authorList.length,
            itemBuilder: (context, index) {
              return DetailSameBook(data: authorList[index]);
            },
            separatorBuilder: (context, index) {
              return VerticalDivider(
                width: 16.0,
                color: Color(0xFFFFFFFF),
              );
            },
          ),
        ),
      ]),
    );
  }
}