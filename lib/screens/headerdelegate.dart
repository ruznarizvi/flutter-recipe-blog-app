import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double height;

  SectionHeaderDelegate(this.title, [this.height = 120]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 120.0,
      width: double.infinity,

      decoration: BoxDecoration(
        color: Color(0xFFffffe6),

      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Browse Categories",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600
            ),),
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}