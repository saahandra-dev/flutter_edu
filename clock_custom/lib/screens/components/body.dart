import 'dart:math';

import 'package:clock_custom/screens/components/clock.dart';
import 'package:clock_custom/screens/components/time_hour_and_min.dart';
import 'package:clock_custom/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:  Column(
        children: [
          Text(
            'Newport Beach, USA | PST',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInHourAndMin(),
          Clock()
        ],
      ),
    );
  }
}

