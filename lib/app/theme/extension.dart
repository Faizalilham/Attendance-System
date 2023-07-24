import 'dart:ui';

import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';

extension Neumorphism on Widget {
  addNeumorphism({
    double borderRadius = 10.0,
    Offset offset = const Offset(4, 4),
    double blurRadius = 15,
    double spreadRadius = 1,
    Color topShadowColor = Colors.white60,
    Color bottomShadowColor = const Color(0x26234395),
  }) {
    return Container(
     
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: bottomShadowColor,
            spreadRadius: spreadRadius
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dx),
            blurRadius: blurRadius,
            color: topShadowColor,
            spreadRadius: spreadRadius

          ),
        ],
      ),
      child: this,
    );
  }
}

extension Glassmorphism on Widget {
  addGlassmorphism(
      {double blur = 15, double opacity = 0.2, double radius = 10}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          margin: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: this,
        ),
      ),
    );
  }
}





