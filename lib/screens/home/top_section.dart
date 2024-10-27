import 'package:alpha16/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSection extends StatefulWidget {
  const TopSection({
    super.key,
  });

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  bool switchSection = true;

  void switchWiggets(bool toggle) {
    print(switchSection);
    if (switchSection != toggle) {
      setState(() => switchSection = toggle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(4),
          width: 276,
          height: 38,
          child: Row(
            children: [
//Activity
              GestureDetector(
                onTap: () => switchWiggets(true),
                child: Container(
                  child: Center(
                      child: Text(
                    'Activity',
                    style: switchSection
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: blueCustom),
                  )),
                  decoration: BoxDecoration(
                      color: switchSection ? blueCustom : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 134,
                  height: 30,
                ),
              ),

//Saved
              GestureDetector(
                onTap: () => switchWiggets(false),
                child: Container(
                  child: Center(
                      child: Text(
                    'Saved',
                    style: switchSection == false
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: greyCustom),
                  )),
                  decoration: BoxDecoration(
                      color: switchSection == false ? blueCustom : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: 134,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Center(child: SvgPicture.asset('assets/images/Group1.svg')),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 54,
          height: 38,
        )
      ],
    );
  }
}
