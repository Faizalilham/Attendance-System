import 'package:attendance_system/app/components/responsive.dart';

import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:attendance_system/app/modules/dashboard/views/components/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  Function() onPress;
  Header({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => onPress()
          ),
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const ProfileSection(),
      ],
    );
  }
}
