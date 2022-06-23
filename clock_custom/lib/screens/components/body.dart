import 'package:clock_custom/screens/components/clock.dart';
import 'package:clock_custom/screens/components/country_card.dart';
import 'package:clock_custom/screens/components/time_hour_and_min.dart';
import 'package:clock_custom/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child:  Column(
          children: [
            Text(
              'Newport Beach, USA | PST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TimeInHourAndMin(),
            Spacer(),
            Clock(),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CountryCard(
                    country: "New York, USA",
                    timeZone: "+3 HRS | EST",
                    iconSrc: "assets/icons/Liberty.svg",
                    time: "9:20",
                    period: "PM",
                  ),
                  CountryCard(
                    country: "Sydney, AU",
                    timeZone: "+19 HRS | EST",
                    iconSrc: "assets/icons/Sydney.svg",
                    time: "1:20",
                    period: "AM",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

