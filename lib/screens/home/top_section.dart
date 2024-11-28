import 'package:alpha16/constants/constants.dart';

import 'package:alpha16/providers/top_section_provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

//Меню: Activity Saved Settings

class TopSection extends StatefulWidget {
  const TopSection({
    super.key,
  });

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    final topSectionProvider = context.watch<TopSectionProvider>();
    final activity = topSectionProvider.activity;
    final toggleActivity = topSectionProvider.toggleActivity;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(4),
              width: 276,
              height: 38,
              child: Row(children: [
                //Activity
                GestureDetector(
                  onTap: () => toggleActivity(true),
                  child: Container(
                    child: Center(
                        child: Text(
                      'Activity'.tr(),
                      style: activity == true
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: blueCustom),
                    )),
                    decoration: BoxDecoration(
                        color: activity == true ? blueCustom : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    width: 134,
                    height: 30,
                  ),
                ),

                //Saved
                GestureDetector(
                    onTap: () => toggleActivity(false),
                    child: Container(
                        child: Center(
                            child: Text(
                          'Saved'.tr(),
                          style: activity == false
                              ? TextStyle(color: Colors.white)
                              : TextStyle(color: greyCustom),
                        )),
                        decoration: BoxDecoration(
                            color:
                                activity == false ? blueCustom : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        width: 134,
                        height: 30))
              ])),

          //settings
          GestureDetector(
            onTap: () {
              context.go("/settings");
            },
            child: Container(
              child:
                  Center(child: SvgPicture.asset('assets/images/Group1.svg')),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 54,
              height: 38,
            ),
          )
        ],
      ),
    );
  }
}
