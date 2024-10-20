import 'package:alpha16/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
  });

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
              Container(
                child: Center(
                    child: Text(
                  'Activity',
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                    color: blueCustom,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 134,
                height: 30,
              ),
              Container(
                child: Center(
                    child: Text(
                  'Saved',
                  style: TextStyle(color: greyCustom),
                )),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 134,
                height: 30,
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
