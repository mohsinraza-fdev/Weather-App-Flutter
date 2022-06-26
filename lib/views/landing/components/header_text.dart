import 'package:flutter/material.dart';

import '../../../shared/styles.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
            text: 'Hello,\n',
            style: heading1.copyWith(
              color: appSecondaryColor,
              height: 1,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: "Let's set your\n",
                  style: heading1.copyWith(
                    color: appGreyColor,
                    height: 63.5 / 57,
                  )),
              TextSpan(
                  text: "weather..",
                  style: heading1.copyWith(
                    color: appPrimaryColor,
                    height: 63.5 / 57,
                  )),
            ]),
      ),
    );
  }
}
