// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_field, prefer_final_fields

import 'package:budget_tracker_linechart_ex_211005/json/profile_json.dart';
import 'package:budget_tracker_linechart_ex_211005/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _email = TextEditingController(text: email);
  TextEditingController _dateOfBirth = TextEditingController(text: dateOfBirth);
  TextEditingController _password = TextEditingController(text: password);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: grey.withOpacity(0.05), body: getBody());
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: duplicate_ignore
                    children: [
                      Text(
                        'Profile',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      Icon(Icons.settings)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: (size.width - 40) * 0.4,
                        child: Container(
                            child: Stack(
                          children: [
                            RotatedBox(
                              quarterTurns: -2,
                              child: CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap
                                    .round, // 인디케이터가 끝나는 부분모양 정하는거
                                backgroundColor: grey.withOpacity(0.3),
                                radius: 110.0,
                                lineWidth: 6.0, // 라인 두께
                                percent: 0.53,
                                progressColor: primary,
                              ),
                            ),
                            Positioned(
                              top: 12,
                              left: 12,
                              child: Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/myungdong_church.jpg'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // ignore: prefer_const_constructors
                            Text(
                              'Credit score : $credit',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: black.withOpacity(0.4)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 25, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'United Bank Asia',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$2440.50',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: white)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Update',
                                style: TextStyle(color: white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: grey,
                  ),
                ),
                TextField(
                  controller: _email,
                  cursorColor: primary,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: black,
                  ),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(height: 20),
                Text(
                  'Date Of Birth',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: grey,
                  ),
                ),
                TextField(
                  controller: _dateOfBirth,
                  cursorColor: primary,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: grey,
                  ),
                ),
                TextField(
                  obscureText: true,
                  controller: _password,
                  cursorColor: primary,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(height: 50)
              ],
            ),
          )
        ],
      ),
    );
  }
}
