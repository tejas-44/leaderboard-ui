import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard_ui/widgets/Rank-Widget.dart';
import 'package:sizer/sizer.dart';
import 'package:leaderboard_ui/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;

class Leaderboard extends StatefulWidget {
  static String id = 'LeaderBoard';
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  void initState() {
    // TODO: implement initState
    // print(participantsRef.doc().get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkGreyColor,
        body: SizedBox(
          // maine khudse daala hai unbound dikha rha  tha isliye...iske badle kuch aur use  krna padega
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // This is the header of the leaderboard
              Container(
                color: kPurpleColor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      Text(
                        "LEADER BOARD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/images/csi-logo.png",
                        width: 25.w,
                      ),
                    ],
                  ),
                ),
              ),
              // This is the column name code
              Container(
                color: kDarkGreyColor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 3.w, 10.w, 3.w),
                  child: Row(
                    children: [
                      Text("USERNAME", style: kColumnNameTextStyle),
                      Spacer(),
                      // This row is made for grouping the two columns i.e points and time
                      Row(
                        children: [
                          Text("POINTS", style: kColumnNameTextStyle),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("TIME", style: kColumnNameTextStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              MessagesStream()
              // RankWidget(
              //     rank: '1', username: 'Striver', time: '4.8', points: '6.308'),
              // RankWidget(
              //     rank: '1', username: 'Striver', time: '4.8', points: '6.308'),
              // RankWidget(
              //     rank: '1', username: 'Striver', time: '4.8', points: '6.308'),
              // RankWidget(
              //     rank: '1', username: 'Striver', time: '4.8', points: '6.308'),

              // Container(
              //   color: kDarkGreyColor,
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(5.w,2.w,10.w,2.w),
              //     child: Row(
              //       children: [
              //         Text("1", style: kColumnItemNameStyle,),
              //         SizedBox(width: 3.5.w,),
              //         Text("Striver", style: kColumnUsernameStyle,),
              //         Spacer(),
              //         Row(
              //           children: [
              //             Text("6.308",style: kColumnItemNameStyle,),
              //             SizedBox(width: 7.w,),
              //             Text("4.8",style: kColumnItemNameStyle,),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('Leaderboard').orderBy('rank',descending: false).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final messages = snapshot.data!.docs;
        print(messages);
        List<RankWidget> messageWidgets = [];
        for (var message in messages) {
          final points = message['points'].toString();
          final rank = message['rank'].toString();
          final time = message['time'].toString();
          final username = message['username'];
          print(username);

          final messageWidget = RankWidget(
              rank: rank, username: username, time: time, points: points);
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
