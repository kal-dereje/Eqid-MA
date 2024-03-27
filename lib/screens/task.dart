import 'package:flutter/material.dart';
import 'home.dart';

class Tasks extends StatelessWidget {
  TimeOfDay time = const TimeOfDay(
    hour: 10,
    minute: 30,
  );
  DateTime date = DateTime(2023, 02, 12);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 10, left: 16),
            child: Text('Tasks',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w900,
                    color: Colors.black))),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(
              padding: EdgeInsets.only(top: 10, left: 16),
              child: Icon(
                Icons.add,
                color: Colors.greenAccent,
                size: 20,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: TextButton(
              child: const Text("Add Category"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          insetPadding: const EdgeInsets.only(
                              top: 38, bottom: 38, right: 25, left: 25),
                          contentPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
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
                                    color: const Color(0xFF052124)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  color: Color(0xFF12D7A7),
                                                  size: 30,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 7),
                                                    child: Text(
                                                      'Date',
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
                                                    const Color(0xFF052124),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MyHomePage()));
                                              },
                                              child: const Icon(
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
                                            color: const Color.fromARGB(
                                                255, 3, 17, 19),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 3, 17, 19),
                                                shape: RoundedRectangleBorder(
                                                    //to set border radius to button
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
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
                                                            colorScheme: const ColorScheme.light(
                                                                primary: Color(
                                                                    0xFF052124),
                                                                primaryContainer:
                                                                    Colors
                                                                        .black,
                                                                secondaryContainer:
                                                                    Colors
                                                                        .black,
                                                                onSecondary: Colors
                                                                    .greenAccent,
                                                                onPrimary: Colors
                                                                    .greenAccent,
                                                                surface: Colors
                                                                    .greenAccent,
                                                                onSurface:
                                                                    Colors
                                                                        .black,
                                                                secondary:
                                                                    Colors
                                                                        .black),
                                                            dialogBackgroundColor:
                                                                Colors.white,
                                                          ),
                                                          child: child ??
                                                              const Text(""),
                                                        );
                                                      },
                                                      context: context,
                                                      initialDate: date,
                                                      firstDate: DateTime(1990),
                                                      lastDate: DateTime(2100));
                                            },
                                            child: Text(
                                              '${date.day}/${date.month}/${date.year}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Color(0xFF12D7A7),
                                              ),
                                            ))),
                                    const Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Color(0xFF12D7A7),
                                              size: 30,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
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
                                            color: const Color.fromARGB(
                                                255, 3, 17, 19),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
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
                                                            colorScheme: const ColorScheme.light(
                                                                primary: Colors
                                                                    .greenAccent,
                                                                primaryContainer:
                                                                    Colors
                                                                        .black,
                                                                secondaryContainer:
                                                                    Colors
                                                                        .black,
                                                                onSecondary:
                                                                    Colors
                                                                        .white,
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                                surface: Colors
                                                                    .white,
                                                                onSurface:
                                                                    Colors
                                                                        .black,
                                                                secondary:
                                                                    Colors
                                                                        .black),
                                                            dialogBackgroundColor:
                                                                Colors.white,
                                                          ),
                                                          child: child ??
                                                              const Text(""),
                                                        );
                                                      },
                                                      context: context,
                                                      initialTime: time);
                                              if (newTime == null) {
                                                return;
                                              }
                                            },
                                            child: Text(
                                              '${time.hour}:${time.minute}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Color(0xFF12D7A7),
                                              ),
                                            ))),
                                    const Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.task_outlined,
                                              color: Color(0xFF12D7A7),
                                              size: 30,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
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
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                          width: 300,
                                          height: 46,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color.fromARGB(
                                                255, 3, 17, 19),
                                          ),
                                          child: const TextField(
                                              decoration: InputDecoration(
                                            labelText: 'Name of task',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 148, 149, 149),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.all(30),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.more_horiz,
                                              color: Color(0xFF12D7A7),
                                              size: 30,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 7),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 3, 17, 19),
                                        ),
                                        child: const TextField(
                                            decoration: InputDecoration(
                                          labelText: 'Event,description,etc...',
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 148, 149, 149),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                    Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: const Color.fromARGB(
                                                      255, 14, 71, 79)
                                                  .withOpacity(0.5)),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.greenAccent,
                                            size: 50,
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            },
                          ),
                        ));
              },
            ),
          )
        ])
      ],
    );
  }
}
