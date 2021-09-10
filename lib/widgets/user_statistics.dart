import 'package:flutter/material.dart';

import '../constants.dart';

class UserStatistic extends StatelessWidget {
  final int nPosts;
  final int nFollowers;
  final int nFollowing;
  const UserStatistic({
    Key? key,
    required this.nPosts,
    required this.nFollowers,
    required this.nFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatisticItem(stats: this.nPosts, statsName: 'Posts'),
          StatisticItem(stats: this.nFollowers, statsName: 'Followers'),
          StatisticItem(stats: this.nFollowing, statsName: 'Following'),
        ],
      ),
    );
  }
}

class StatisticItem extends StatelessWidget {
  final int stats;
  final String statsName;
  const StatisticItem({
    Key? key,
    required this.stats,
    required this.statsName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.stats.toString(),
          style: mainFontTextStyle.copyWith(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          this.statsName,
          style: mainFontTextStyle.copyWith(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
