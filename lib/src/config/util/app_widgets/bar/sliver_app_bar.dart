import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  final Widget content;
  final Widget title;

  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  const SliverAppBarWidget(
      {super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blue,
          pinned: _pinned,
          snap: _snap,
          floating: _floating,
          expandedHeight: 160.0,
          flexibleSpace: FlexibleSpaceBar(
            title: title,
            centerTitle: true,
            //title: Text('Title'),
            //background: Colors,
          ),
        ),
        SliverFillRemaining(
          child: content,
          // child: Center(
          //   child: Text('Hello'),
          // ),
        ),
      ],
    );
  }
}
