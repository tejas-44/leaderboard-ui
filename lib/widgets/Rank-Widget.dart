import 'package:flutter/material.dart';
import 'package:leaderboard_ui/constants.dart';
import 'package:sizer/sizer.dart';


Widget rankWidget(){
  return Container(
    color: kDarkGreyColor,
    child: Padding(
      padding: EdgeInsets.fromLTRB(5.w,2.w,10.w,2.w),
      child: Row(
        children: [
          Text("1", style: kColumnItemNameStyle,),
          SizedBox(width: 3.5.w,),
          Text("Striver", style: kColumnUsernameStyle,),
          Spacer(),
          Row(
            children: [
              Text("6.308",style: kColumnItemNameStyle,),
              SizedBox(width: 7.w,),
              Text("4.8",style: kColumnItemNameStyle,),
            ],
          ),
        ],
      ),
    ),
  );
}