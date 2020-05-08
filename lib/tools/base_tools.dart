import 'package:flutter_screenutil/flutter_screenutil.dart';

double setHeight(double value) {
  return ScreenUtil.getInstance().setHeight(value) as double;
}

double setWidth(double value) {
  return ScreenUtil.getInstance().setWidth(value) as double;
}

double setSp(double value) {
  return ScreenUtil.getInstance().setSp(value) as double;
}
