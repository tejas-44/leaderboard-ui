import 'package:flutter/material.dart';
import 'package:leaderboard_ui/constants.dart';
import 'package:sizer/sizer.dart';

class RankWidget extends StatelessWidget {
  final int rank;
  final String username;
  final double time;
  final double points;
  RankWidget(
      {required this.rank,
      required this.username,
      required this.time,
      required this.points});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkGreyColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 2.w, 10.w, 2.w),
        child: Row(
          children: [
            Text(
              rank.toString(),
              style: kColumnItemNameStyle,
            ),
            SizedBox(
              width: 3.5.w,
            ),
            Text(
              username,
              style: kColumnUsernameStyle,
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  time.toString(),
                  style: kColumnItemNameStyle,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  points.toString(),
                  style: kColumnItemNameStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
