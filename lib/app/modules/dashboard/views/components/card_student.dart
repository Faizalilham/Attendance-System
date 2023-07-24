import 'package:attendance_system/app/data/data_source/core/attendances.dart';
import 'package:attendance_system/app/data/data_source/core/students_response.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:attendance_system/app/theme/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/date_symbol_data_local.dart';

class CardStudent extends StatelessWidget {
  Student? student;
  StudentTodayResponse? Str;
  CardStudent({Key? key, required this.student,required this.Str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Str == null ?
    Container(
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: const BoxDecoration(
          // image:  size < 340 ? const DecorationImage(image: AssetImage("assets/Icons/vector.png")) : const  DecorationImage(image: AssetImage("")),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
          child: ExpansionTile(
        iconColor: primaryColor,
        collapsedIconColor: primaryColor,
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        leading: CachedNetworkImage(
          imageUrl: student!.images,
          imageBuilder: (context, imageProvider) => Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) =>
              Lottie.asset("assets/json/loading.json", height: 50, width: 50),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(student!.name, style: const TextStyle(fontSize: 16)),
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(student!.nim, style: const TextStyle(fontSize: 16))),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(student!.email, style: const TextStyle(fontSize: 16))),
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(student!.address, style: const TextStyle(fontSize: 16))),
        ],
      )),
    ).addGlassmorphism() : Container(
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: const BoxDecoration(
                // image:  size < 340 ? const DecorationImage(image: AssetImage("assets/Icons/vector.png")) : const  DecorationImage(image: AssetImage("")),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: InkWell(
                child: ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              childrenPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              
              title: Text(Str!.name, style: const TextStyle(fontSize: 16)),
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(Str!.description,
                        style: const TextStyle(fontSize: 16))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(changeDateFormat(Str!.date),
                        style: const TextStyle(fontSize: 16))),
              
              ],
            )),
          ).addGlassmorphism();
  }
}

String changeDateFormat(String inputDate){

  // Mengubah format tanggal menjadi DateTime
  DateTime date = DateFormat("EEE, d MMM yyyy HH:mm:ss 'GMT'").parse(inputDate);

  // Mengubah format tanggal menjadi "Jumat, 23 Juni 2023"
  return DateFormat("EEEE, d MMMM yyyy", "id_ID").format(date);
}