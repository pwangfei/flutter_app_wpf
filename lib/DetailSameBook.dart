import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailSameBook extends StatelessWidget {
  final AuthorModel data;

  const DetailSameBook({
     Key? key,
     required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      width: 66,
      child: Column(
        children: <Widget>[
          Image.network(this.data.userImgUrl, width: 66, height: 95),
          Padding(padding: EdgeInsets.only(top: 7)),
          Text(
            this.data.bookName,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 12,
              color: Color(0xE6000000),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorModel {
  /// 书本名称
  final String bookName;

  /// 书本 图像
  final String userImgUrl;

  const AuthorModel({
    required this.bookName,
    required this.userImgUrl,
  });
}

/// 好友列表模拟数据
const List<AuthorModel> authorList = [
  AuthorModel(
    bookName: 'Sold Her Virginitty',
    userImgUrl: "https://statics.libri7.com/common_dev/cover/5ce7f891df3d4d559fdb1c9fbe2c9cbc.jpg",
  ),
  AuthorModel(
    bookName: 'Sold Her Virginitty',
    userImgUrl: "https://statics.libri7.com/common_dev/cover/27528cd3f1fb4a9b8a55cc84a30344ab.jpg",
  ),
  AuthorModel(
    bookName: 'Sold Her Virginitty',
    userImgUrl: "https://statics.libri7.com/common_dev/cover/e27542d6656c487cab20f41f0ac92997.jpg",
  ),
  AuthorModel(
    bookName: 'Sold Her Virginitty',
    userImgUrl: "https://statics.libri7.com/common_dev/cover/71bf833bb88443928f68e7396169193e.jpg",
  ),
  AuthorModel(
    bookName: 'Sold Her Virginitty',
    userImgUrl: "https://statics.libri7.com/common_dev/cover/5ce7f891df3d4d559fdb1c9fbe2c9cbc.jpg",
  ),
  AuthorModel(
    bookName: 'Sold Her Virginitty',
    userImgUrl: "https://statics.libri7.com/common_dev/cover/a7d7239bdc0d4dc091b55fd7d0bf0640.jpg",
  ),
];
