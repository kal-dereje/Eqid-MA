import 'package:flutter/material.dart';
import 'package:test/screens/Home/addtask.dart';
import 'package:test/screens/Home/task.dart';

class Taskitem extends StatefulWidget {
  final TodoTasks tasks;
  final handleChange;
  final deleteItem;

  const Taskitem(
      {Key? key,
      required this.tasks,
      required this.handleChange,
      required this.deleteItem})
      : super(key: key);

  @override
  State<Taskitem> createState() => _TaskitemState();
}

class _TaskitemState extends State<Taskitem> {
  bool isVisible = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.handleChange(widget.tasks);
        },
        child: SizedBox(
            child: Row(
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
                      widget.tasks.isDone!
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank,
                      color: Color.fromARGB(255, 66, 109, 235),
                      size: 20,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 5, top: 13),
                            child: Text(
                              widget.tasks.name!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Futura',
                                  color: Colors.black,
                                  decoration: widget.tasks.isDone!
                                      ? TextDecoration.lineThrough
                                      : null),
                            )),
                        Row(children: [
                          Padding(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Text(
                                widget.tasks.time!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Futura',
                                  color: Colors.black45,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 2, top: 5),
                              child: Text(
                                widget.tasks.description!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Futura',
                                  color: Colors.black45,
                                ),
                              )),
                        ])
                      ]),
                ],
              ),
              SizedBox(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Visibility(
                    visible: isVisible,
                    child: IconButton(
                        onPressed: () {
                          Addtask();
                          toggleVisibility();
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 41, 41, 41),
                          size: 20,
                        ))),
                Visibility(
                    visible: isVisible,
                    child: IconButton(
                        onPressed: () {
                          widget.deleteItem(widget.tasks.id);
                          toggleVisibility();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 41, 41, 41),
                          size: 20,
                        ))),
                Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: IconButton(
                        onPressed: () {
                          toggleVisibility();
                        },
                        icon: Icon(
                          Icons.more_vert,
                          color: Color.fromARGB(255, 41, 41, 41),
                          size: 20,
                        )))
              ])),
            ])));
  }
}
