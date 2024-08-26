import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBAr extends StatelessWidget {
  const CustomTabBAr({super.key});

  @override
  Widget build(BuildContext context) {
    const items = ['Women', 'Men', 'Kids'];
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Container(
        height: 35.h,
        color: Colors.white,
        child: TabBar(
          onTap: (value) {
            // BlocProvider.of<TabBarCubit>(context)
            //     .getSelectedTabIndex(value);
          },
          isScrollable: false,
          labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          labelColor: Colors.white,
          unselectedLabelStyle: TextStyle(fontSize: 16.sp),
          unselectedLabelColor: Colors.black,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          tabs: items.map((e) => Tab(text: e)).toList(),
        ),
      ),
    );
  }
}
