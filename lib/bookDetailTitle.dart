import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Util.dart';

class bookDetailTitle extends StatelessWidget {

  final BookDetailData data;

  const bookDetailTitle({
    Key? key,
    required this.data,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: Image.network(
                  this.data.imgUrl,
                  width: 147,
                  height: 212
              )
          ),
          // Image.network(this.data.imgUrl, width: 147, height: 212),
          Padding(padding: EdgeInsets.only(left: 16)),
          Container(
            height: 212,
            width: 139,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.data.bookName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Color(0xE6000000),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 6)),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: this.data.auther + " | ",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 12, color: Color(0xB3000000))),
                    TextSpan(
                        text: this.data.state,
                        style: TextStyle(color: Color(0x4D000000), fontSize: 12)),
                  ]),
                ),
                Padding(padding: EdgeInsets.only(top: 23)),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Reads",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 12, color: Color(0x4D000000))),
                    TextSpan(
                        text: " | "+this.data.readNum,
                        style: TextStyle(color: Color(0xB3000000), fontSize: 12)),
                  ]),
                ),
                Text(
                  "厉害我的国",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    color: Color(0x80000000),
                  ),
                ),
                Expanded(child: SizedBox()),//自动扩展挤压
                Text(
                  this.data.score,
                  style: TextStyle(
                    fontFamily: 'fzwbjw',
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    color: Color(0xE6FF9A4F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookDetailData {

  /// 书本封面
  final String imgUrl;
  /// 书本信息
  final String bookName;
  /// 作者信息
  final String auther;
  /// 阅读数
  final String readNum;
  /// 书本分数
  final String score;
  /// 状态
  final String state;


  const BookDetailData({
    required this.imgUrl,
    required this.bookName,
    required this.auther,
    required this.readNum,
    required this.score,
    required this.state,
  });
}

/// 好友列表模拟数据
const List<BookDetailData> bookDetailDataList = [
  BookDetailData(
      imgUrl:
          'https://statics.libri7.com/common/bookcover/file-164fe270-7eb5-4323-b640-3c65baf09aa1_thumb.jpg',
      score: '8.0',
      bookName: 'The Girl He Marked',
      readNum: '374K',
      auther: '作者',
      state: '连载'),
  BookDetailData(
      imgUrl:
          'https://statics.libri7.com/common/bookcover/file-164fe270-7eb5-4323-b640-3c65baf09aa1_thumb.jpg',
      score: '8.0',
      bookName: 'The Girl He Marked',
      readNum: '374K',
      auther: '作者',
      state: '连载'),
  BookDetailData(
      imgUrl:
          'https://statics.libri7.com/common/bookcover/file-164fe270-7eb5-4323-b640-3c65baf09aa1_thumb.jpg',
      score: '8.0',
      bookName: 'The Girl He Marked',
      readNum: '374K',
      auther: '作者',
      state: '连载'),
  BookDetailData(
      imgUrl:
          'https://statics.libri7.com/common/bookcover/file-164fe270-7eb5-4323-b640-3c65baf09aa1_thumb.jpg',
      score: '8.0',
      bookName: 'The Girl He Marked',
      readNum: '374K',
      auther: '作者',
      state: '连载'),
  BookDetailData(
      imgUrl:
          'https://statics.libri7.com/common/bookcover/file-164fe270-7eb5-4323-b640-3c65baf09aa1_thumb.jpg',
      score: '8.0',
      bookName: 'The Girl He Marked',
      readNum: '374K',
      auther: '作者',
      state: '连载'),
];
