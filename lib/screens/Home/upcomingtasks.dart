import 'package:flutter/material.dart';

class UpcomingTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 35, left: 16),
                child: Text('Upcoming Tasks',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w800,
                        color: Colors.black))),
            Padding(
              padding: EdgeInsets.only(top: 35, right: 10),
              child: Text(
                'View all',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Futura',
                  color: Color(0XFF343E87),
                ),
              ),
            ),
          ]),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Expanded(
              child: Row(children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                    height: 130,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          Color.fromARGB(255, 129, 234, 129).withOpacity(0.5),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Personal project',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Futura',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 60, 210, 73),
                                size: 9,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Deploy my Portfolio website',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Futura',
                                          color: Colors.black),
                                      maxLines: 3,
                                    ))),
                          ]),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '3 hours left',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 164, 164, 164),
                              ),
                            ),
                          ),
                        ]))),
            Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                    height: 130,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          Color.fromARGB(255, 129, 171, 234).withOpacity(0.5),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Personal project',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Futura',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 60, 120, 210),
                                size: 9,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Deploy my Portfolio website',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Futura',
                                          color: Colors.black),
                                      maxLines: 3,
                                    ))),
                          ]),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '3 hours left',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 164, 164, 164),
                              ),
                            ),
                          ),
                        ]))),
            Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                    height: 130,
                    width: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          Color.fromARGB(255, 231, 129, 234).withOpacity(0.5),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Personal project',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Futura',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 203, 60, 210),
                                size: 9,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Deploy my Portfolio website',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Futura',
                                          color: Colors.black),
                                      maxLines: 3,
                                    ))),
                          ]),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '3 hours left',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Futura',
                                color: Color.fromARGB(255, 164, 164, 164),
                              ),
                            ),
                          ),
                        ])))
          ])))
    ]);
  }
}
