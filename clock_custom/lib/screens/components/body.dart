import 'dart:math';

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

class Clock extends StatefulWidget {
  const Clock({Key key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                color: kShadowColor.withOpacity(0.14),
                blurRadius: 64,
              )
            ]
          ),
          child: CustomPaint(
            painter: ClockPainter(context, _dateTime),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    //minute hand line
    canvas.drawLine(
      center, Offset(40, 180), 
      Paint()
        ..color =Theme.of(context).accentColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10);

    //hour hand calculation
    double hourX =
    centerX + size.width * 0.3 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180); 
    double hourY = 
    centerY + size.width * 0.3 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    //hour hand line
    canvas.drawLine(center, Offset(hourX, hourY), 
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10);

    //second hand calculation
    double secondX = 
      centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
      centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    //second hand line
    canvas.drawLine(center, Offset(secondX, secondY), 
      Paint()..color = Theme.of(context).primaryColor);

    //center dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(
      center, 23, Paint()..color = Theme.of(context).backgroundColor);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;  
  }
}


