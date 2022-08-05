import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Util.dart';

class FriendCard extends StatelessWidget {
  final FriendViewModel data;

  const FriendCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 9, bottom: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(this.data.userImgUrl, width: 22, height: 22),
          Padding(padding: EdgeInsets.only(top: 7)),
          Text(
            this.data.userName,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 10,
              color: Color(0x80000000),
            ),
          ),
        ],
      ),
    );
  }
}

class FriendViewModel {
  /// 用户昵称
  final String userName;

  /// 用户头像
  final String userImgUrl;

  const FriendViewModel({
    required this.userName,
    required this.userImgUrl,
  });
}

/// 好友列表模拟数据
const List<FriendViewModel> friendList = [
  FriendViewModel(
    userName: 'Popular',
    userImgUrl: "image/best_selling.png",
  ),
  FriendViewModel(
    userName: 'Collections',
    userImgUrl: "image/classification.png",
  ),
  FriendViewModel(
    userName: 'Hot',
    userImgUrl: "image/hot_reading.png",
  ),
  FriendViewModel(
    userName: 'New',
    userImgUrl: "image/new_book.png",
  ),
  FriendViewModel(
    userName: 'Ratings',
    userImgUrl: "image/soar.png",
  ),
  FriendViewModel(
    userName: 'Completed',
    userImgUrl: "image/list_end.png",
  ),
];
