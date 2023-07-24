import 'package:flutter/material.dart';

AppBar appBarC(String tittle) {
  return AppBar(

    elevation: 0,
    title: Text(tittle,style: const TextStyle(color: Colors.white70),),
    centerTitle: true,
    foregroundColor: Colors.white,
    backgroundColor: Colors.transparent,
  );
}
