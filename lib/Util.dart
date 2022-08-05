import 'package:flutter_svg/flutter_svg.dart';

class Utils {
  static String svgPath(String svgName) {
    return "image/$svgName";
  }

  static SvgPicture svg(String svgName, {required double width, required double height}) {
    var name = svgName;
    if (name.endsWith(".svg") == false) {
      name = "$svgName.svg";
    }
    return SvgPicture.asset(Utils.svgPath(name), width: width, height: height,);
  }
}
