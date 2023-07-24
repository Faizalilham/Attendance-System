import 'package:attendance_system/app/model/list_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListItemDrawer extends StatelessWidget {
  const ListItemDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var datas in listDrawer)
          ListTile(
            leading: SvgPicture.asset(datas.image,color: Colors.white,width: 25,height: 25),
            title:
                Text(datas.tittle, style: const TextStyle(color: Colors.white)),
            horizontalTitleGap: 0.8,
            textColor: Colors.white,
            iconColor: Colors.white,
            onTap: () => navigation(datas.id),
          )
      ],
    );
  }
}
