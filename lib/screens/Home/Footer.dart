import 'package:flutter/material.dart';

class Footers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(color: Color.fromARGB(255, 223, 223, 223)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Icon(
                  Icons.file_copy_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Icon(
                  Icons.people,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3),
                child: Icon(
                  Icons.person_3_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ]));
  }
}
