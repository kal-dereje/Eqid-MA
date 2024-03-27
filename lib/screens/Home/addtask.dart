import 'package:flutter/material.dart';
import 'package:test/screens/Home/home.dart';
import 'package:test/screens/Home/task.dart';

class Addtask extends StatefulWidget {
  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  TimeOfDay time = TimeOfDay(
    hour: 10,
    minute: 30,
  );

  DateTime date = DateTime(2023, 02, 12);
  final tasklist = TodoTasks.tasklist();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 140,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 3),
            child: Icon(
              Icons.add,
              color: Colors.greenAccent,
              size: 25,
            ),
          ),
          TextButton(
            child: Text(
              'AddTask',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Futura',
                color: Colors.white,
              ),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        insetPadding: EdgeInsets.only(
                            top: 38, bottom: 38, right: 25, left: 25),
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery.of(context).size.height;
                            var width = MediaQuery.of(context).size.width;

                            return Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFF052124)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                color: Color(0xFF12D7A7),
                                                size: 30,
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 7),
                                                  child: Text(
                                                    '${date.year}:${date.month}:${date.day}',
                                                    style: TextStyle(
                                                      fontSize: 27,
                                                      fontFamily: 'Futura',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 203, 204, 205),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xFF052124),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyHomePage()));
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Color(0xFF12D7A7),
                                              size: 45,
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                      height: 55,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 3, 17, 19),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 3, 17, 19),
                                              shape: RoundedRectangleBorder(
                                                  //to set border radius to button
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Text(
                                            '${date.year}:${date.month}:${date.day}',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFF12D7A7),
                                            ),
                                          ),
                                          onPressed: () async {
                                            DateTime? newDate =
                                                await showDatePicker(
                                                    builder:
                                                        (BuildContext context,
                                                            Widget? child) {
                                                      return Theme(
                                                        data: ThemeData(
                                                          splashColor:
                                                              Colors.black,
                                                          colorScheme: ColorScheme.light(
                                                              primary: Color(
                                                                  0xFF052124),
                                                              primaryContainer:
                                                                  Colors.black,
                                                              secondaryContainer:
                                                                  Colors.black,
                                                              onSecondary: Colors
                                                                  .greenAccent,
                                                              onPrimary: Colors
                                                                  .greenAccent,
                                                              surface: Colors
                                                                  .greenAccent,
                                                              onSurface:
                                                                  Colors.black,
                                                              secondary:
                                                                  Colors.black),
                                                          dialogBackgroundColor:
                                                              Colors.white,
                                                        ),
                                                        child: child ??
                                                            Text(
                                                                '${date.year}:${date.month}:${date.day}'),
                                                      );
                                                    },
                                                    context: context,
                                                    initialDate: date,
                                                    firstDate: DateTime(1990),
                                                    lastDate: DateTime(2100));
                                            if (newDate != null) {
                                              setState(() {
                                                date = newDate;
                                                _dateController.text =
                                                    newDate.toString();
                                              });
                                            }
                                          })),
                                  Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Color(0xFF12D7A7),
                                            size: 30,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 7),
                                              child: Text(
                                                'Time',
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  fontFamily: 'Futura',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 203, 204, 205),
                                                ),
                                              ))
                                        ],
                                      )),
                                  Container(
                                      height: 44,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 3, 17, 19),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 3, 17, 19),
                                              shape: RoundedRectangleBorder(
                                                  //to set border radius to button
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () async {
                                            TimeOfDay? newTime =
                                                await showTimePicker(
                                                    builder:
                                                        (BuildContext context,
                                                            Widget? child) {
                                                      return Theme(
                                                        data: ThemeData(
                                                          splashColor:
                                                              Colors.black,
                                                          colorScheme: ColorScheme.light(
                                                              primary: Colors
                                                                  .greenAccent,
                                                              primaryContainer:
                                                                  Colors.black,
                                                              secondaryContainer:
                                                                  Colors.black,
                                                              onSecondary:
                                                                  Colors.white,
                                                              onPrimary:
                                                                  Colors.white,
                                                              surface:
                                                                  Colors.white,
                                                              onSurface:
                                                                  Colors.black,
                                                              secondary:
                                                                  Colors.black),
                                                          dialogBackgroundColor:
                                                              Colors.white,
                                                        ),
                                                        child: child ??
                                                            Text(
                                                                '${time.hour}:${time.minute}'),
                                                      );
                                                    },
                                                    context: context,
                                                    initialTime: time);
                                            if (newTime != null) {
                                              setState(() {
                                                _timeController.text =
                                                    newTime.format(context);
                                              });
                                            }
                                          },
                                          child: Text(
                                            '${time.hour}:${time.minute}',
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFF12D7A7),
                                            ),
                                          ))),
                                  Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.task_outlined,
                                            color: Color(0xFF12D7A7),
                                            size: 30,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 7),
                                              child: Text(
                                                'Task',
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  fontFamily: 'Futura',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 203, 204, 205),
                                                ),
                                              ))
                                        ],
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(
                                        width: 300,
                                        height: 46,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(255, 3, 17, 19),
                                        ),
                                        child: TextField(
                                            controller: _taskController,
                                            decoration: InputDecoration(
                                              labelText: 'Name of task',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 148, 149, 149),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(30),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.more_horiz,
                                            color: Color(0xFF12D7A7),
                                            size: 30,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 7),
                                              child: Text(
                                                'Remark',
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  fontFamily: 'Futura',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 203, 204, 205),
                                                ),
                                              )),
                                        ],
                                      )),
                                  Container(
                                      width: 300,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 3, 17, 19),
                                      ),
                                      child: TextField(
                                          controller: _remarkController,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Event,description,etc...',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 148, 149, 149),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: Color.fromARGB(
                                                      255, 14, 71, 79)
                                                  .withOpacity(0.5)),
                                          child: IconButton(
                                            onPressed: () {
                                              addtodoItem(
                                                  _dateController.text,
                                                  _timeController.text,
                                                  _remarkController.text,
                                                  _taskController.text);
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.greenAccent,
                                              size: 50,
                                            ),
                                          )))
                                ],
                              ),
                            );
                          },
                        ),
                      ));
            },
          )
        ]));
  }

  void addtodoItem(String date, String time, String desc, String name) {
    setState(() {
      tasklist.add(TodoTasks(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          date: date,
          time: time,
          description: desc,
          name: name));
      _taskController.clear();
      _dateController.clear();
      _remarkController.clear();
      _timeController.clear();
    });
  }
}
