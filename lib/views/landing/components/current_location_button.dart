import 'package:flutter/material.dart';

import '../../../constants/asset_constants.dart';
import '../../../shared/styles.dart';

class CurrentLocationButton extends StatelessWidget {
  final onTap;

  const CurrentLocationButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.only(left: 20, right: 16),
        height: 72,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appGrey2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: appGrey1),
        ),
        child: Row(
          children: [
            Text(
              "Select Current Location",
              style: paragraph1.copyWith(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Image.asset(
              AssetConstants.arrowIconBlack,
              width: 14,
            )
          ],
        ),
      ),
    );
  }
}
