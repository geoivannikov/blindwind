import 'package:blindwind/constants/base_constants.dart';
import 'package:blindwind/constants/color_constants.dart';
import 'package:blindwind/tools/base_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final Function onTap;
  BarItem({this.icon, this.title, this.isActive, this.onTap});
  @override
  _BarItemState createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(setWidth(30)))),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.isActive ? THEMECOLOR : MID_GREY_COLOR,
              size: setWidth(40),
            ),
            SizedBox(
              width: setWidth(10),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              vsync: this,
              child: Text(
                widget.isActive ? widget.title : "",
                style: TextStyle(
                    color: THEMECOLOR,
                    fontWeight: FontWeight.w500,
                    fontSize: setSp(BASE_FONT_TEXT_SIZE)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
