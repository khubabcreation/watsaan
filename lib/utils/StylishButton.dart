import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'Appcolor.dart';

class stylish_button extends StatefulWidget {
  stylish_button({this.mycolor,required this.txt_for_container,required this.height,required this.width,Key? key}) : super(key: key);
  double height ;
  double width ;
  String txt_for_container ;
  Color? mycolor ;
  @override
  State<stylish_button> createState() => _stylish_buttonState();
}

class _stylish_buttonState extends State<stylish_button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color:widget.mycolor==null? AppColors.freshgreen:widget.mycolor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(26),bottomLeft: Radius.circular(28))),
        height: widget.height,
        width: widget.width,
        child: Center(child: Text(widget.txt_for_container.toString(),style: TextStyle(color:Colors.white,fontSize: 16,fontFamily: 'monster'),),),
      ),
    );
  }
}
