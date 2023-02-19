// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:scroll_ex/pages/keyboard_avoiding.dart';
import 'package:scroll_ex/pages/listview_only.dart';
import 'package:scroll_ex/pages/primary_scroll.dart';
import 'package:scroll_ex/pages/shrink_wrap.dart';
import 'package:scroll_ex/pages/using_expanded.dart';
import 'package:scroll_ex/pages/using_sliver_list.dart';
import 'package:scroll_ex/widgets/my_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll Tips',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scroll Tips',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * (11.7 / 13),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ViewMenuItem(
                  context: context,
                  title: 'Using Expanded',
                  subFunction: () => UsingExpanded(),
                  isLastItem: false,
                ),
                ViewMenuItem(
                  context: context,
                  title: 'Using ListView only',
                  subFunction: () => ListViewOnly(),
                  isLastItem: false,
                ),
                ViewMenuItem(
                  context: context,
                  title: 'Primary Scroll',
                  subFunction: () => PrimaryScroll(),
                  isLastItem: false,
                ),
                ViewMenuItem(
                  context: context,
                  title: 'SliverList',
                  subFunction: () => UsingSliverList(),
                  isLastItem: false,
                ),
                ViewMenuItem(
                  context: context,
                  title: 'ShrinkWrap',
                  subFunction: () => ShrikWrapEx(),
                  isLastItem: false,
                ),
                ViewMenuItem(
                  context: context,
                  title: 'Keyboard avoiding',
                  subFunction: () => KeyboardAvoiding(),
                  isLastItem: true,
                  color: Colors.tealAccent.shade700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ViewMenuItem extends StatelessWidget {
  final BuildContext context;
  final String title;
  final Widget Function() subFunction;
  final bool isLastItem;
  final Color color;

  ViewMenuItem({
    this.context,
    this.title,
    this.isLastItem,
    this.color,
    this.subFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          btnTitle: title,
          color: color == null ? Colors.indigo : color,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return subFunction();
                },
              ),
            );
          },
        ),
        SizedBox(height: isLastItem ? 0.0 : 20.0),
      ],
    );
  }
}
