import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';

class NoConnectionScreen extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/no_connection.png",
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.14,
            left: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 25,
                    color: Colors.black.withOpacity(0.17),
                  ),
                ],
              ),
              child: ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                 shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))
                ),
               ),
                onPressed: () {},
                child: Text("Retry",style: TextStyle(color: secondaryColor)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
