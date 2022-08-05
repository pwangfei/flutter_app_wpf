import 'package:flutter/material.dart';
import 'bookRankScaffold.dart';

class GridViewApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _GridViewAppState();

}

class _GridViewAppState extends State<GridViewApp>
    with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: DEMOS.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 2.31,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          radius: 6.0,
          onTap: () {
            print("onTap");
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return bookRankScaffold();
            // }));
          },
          child: Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Color(0x0D000000), width: 0.5),
              borderRadius: new BorderRadius.circular((6.0)),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image(
                    image: new NetworkImage(DEMOS[index].imageUrl),
                    width: 40,
                    height: 58,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 12)),
              Text(
                DEMOS[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  color: Color(0xE6000000),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

/// 例子
const DEMOS = [
  Demo(
    title: '基础',
    imageUrl: 'https://statics.libri7.com/common_dev/file-fe96feeb-2b15-4998-9947-d2453589bbcc.jpg',
  ),
  Demo(
    title: 'List',
    imageUrl: 'https://statics.libri7.com/common_dev/file-64762ccd-9ce4-42e2-8c01-4d338facaaf1.png',
  ),
  Demo(
    title: 'Grid',
    imageUrl: 'https://statics.libri7.com/common_dev/file-9f3c7850-a06d-4f51-8f31-7a8773e447c3.jpg',
  ),
  Demo(
    title: '自定',
    imageUrl: 'https://statics.libri7.com/common_dev/file-11fab2a2-209e-4e47-a5ca-2af536e104a8.jpg',
  ),
  Demo(
    title: 'Sli',
    imageUrl: 'https://statics.libri7.com/common_dev/file-0a0de0ec-0e34-4830-b6f5-e58caf8452da.jpg',
  ),
  Demo(
    title: 'Grid',
    imageUrl: 'https://statics.libri7.com/common_dev/file-9f3c7850-a06d-4f51-8f31-7a8773e447c3.jpg',
  ),
  Demo(
    title: '自定义',
    imageUrl: 'https://statics.libri7.com/common_dev/file-11fab2a2-209e-4e47-a5ca-2af536e104a8.jpg',
  ),
  Demo(
    title: 'Sli',
    imageUrl: 'https://statics.libri7.com/common_dev/file-0a0de0ec-0e34-4830-b6f5-e58caf8452da.jpg',
  ),
];

class Demo {
  /// 标题
  final String title;

  /// 描述
  final String imageUrl;

  const Demo({
    required this.title,
    required this.imageUrl,
  });
}

