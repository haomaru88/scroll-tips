import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  static const double padding = 20.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.teal,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '2019 생산량',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            viewHead(title: '쌀', weight: '300톤', isLastItem: false),
            viewHead(title: '보리', weight: '100톤', isLastItem: false),
            viewHead(title: '풀사료', weight: '500톤', isLastItem: true),
          ],
        ),
        // Divider(color: Colors.black45),
      ],
    );
  }

  Widget viewHead({String title, String weight, bool isLastItem}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Chip(
                label: Text(weight),
                backgroundColor: Colors.grey[300],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isLastItem == false ? padding : 0.0),
          child: Divider(color: Colors.black45, height: isLastItem == false ? 1 : 0),
        ),
      ],
    );
  }
}
