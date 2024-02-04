// import 'package:badges/badges.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/presentation/theme/color.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    Key? key,
    this.onTap,
    this.notifiedNumber = 0,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    var badges;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(.3)),
        ),
        child: notifiedNumber > 0
            ? badge(
                badgeColor: AppColor.actionColor,
                padding: const EdgeInsets.all(3),
                position: badges.BadgePosition.topEnd(top: -3, end: -3),
                badgeContent: const Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 25,
                  height: 25,
                ),
              )
            : SvgPicture.asset("assets/icons/bell.svg"),
      ),
    );
  }

  badge(
      {required Color badgeColor,
      required EdgeInsets padding,
      required position,
      required Text badgeContent,
      required SvgPicture child}) {}
}
