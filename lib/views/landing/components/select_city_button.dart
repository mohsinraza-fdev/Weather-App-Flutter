import 'package:flutter/material.dart';

import '../../../constants/asset_constants.dart';
import '../../../shared/styles.dart';

class SelectCityButton extends StatelessWidget {
  final onTap;

  const SelectCityButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.only(left: 20, right: 19),
        height: 72,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              'Select City',
              style: paragraph1.copyWith(color: appBackgroundColor),
            ),
            const Spacer(),
            Image.asset(
              AssetConstants.dropdownIconWhite,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
