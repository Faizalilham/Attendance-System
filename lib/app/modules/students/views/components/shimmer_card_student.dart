

import 'package:attendance_system/app/theme/constant.dart';

import 'package:fade_shimmer/fade_shimmer.dart';

import 'package:flutter/material.dart';

class ShimmerCardStudent extends StatelessWidget {
  const ShimmerCardStudent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: const ListTile(
        leading:  FadeShimmer(
          width: 50,
          height: 50,
          radius: 100,
          highlightColor: Color(0xFFA4CDFF),
          baseColor: secondaryColor,
        ),
        title: FadeShimmer(
          width: 100,
          height: 20,
          radius: 10,
          highlightColor: Color.fromARGB(255, 188, 190, 192),
          baseColor: secondaryColor,
        ),
      ),
    );
  }
}