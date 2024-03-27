import 'package:flutter/material.dart';

import '../model/todo.dart';

class Taskitem extends StatelessWidget {
  final Todo todo;
  const Taskitem({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40, top: 10),
                child: Icon(
                  Icons.check_box_rounded,
                  color: Color.fromARGB(255, 66, 109, 235),
                  size: 20,
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(left: 5, top: 13),
                    child: Text(
                      'UI/UX Design Assignmnet',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Futura',
                          color: Colors.black,
                          decoration: TextDecoration.lineThrough),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      '10:30PM Zoom Meeting',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Futura',
                        color: Colors.black45,
                      ),
                    ))
              ]),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, top: 10),
            child: Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 41, 41, 41),
              size: 20,
            ),
          ),
        ]);
  }
}
