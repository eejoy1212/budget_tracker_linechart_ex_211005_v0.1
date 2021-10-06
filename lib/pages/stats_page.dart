// ignore_for_file: unused_import, sized_box_for_whitespace

import 'package:budget_tracker_linechart_ex_211005/json/day_month.dart';
import 'package:budget_tracker_linechart_ex_211005/json/expenses_json.dart';
import 'package:budget_tracker_linechart_ex_211005/theme/colors.dart';
import 'package:budget_tracker_linechart_ex_211005/widgets/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int activeMonth = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget? getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Stats',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                      Icon(Icons.search, size: 28)
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      months.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMonth = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(
                                months[index]['label'],
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: activeMonth == index
                                      ? primary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: activeMonth == index
                                          ? primary
                                          : black.withOpacity(0.1)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 7, bottom: 7, right: 12, left: 12),
                                  child: Text(
                                    months[index]['day'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          activeMonth == index ? white : black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Net balance',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: black.withOpacity(0.3)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '\$2446.90',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        // gradient: LinearGradient(
                        //   colors: [
                        //     Colors.white.withOpacity(0.40),
                        //     Colors.white.withOpacity(0.10)
                        //   ],
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        // ),
                        // borderGradient: LinearGradient(
                        //   colors: [
                        //     Colors.white.withOpacity(0.60),
                        //     Colors.white.withOpacity(0.10),
                        //     Colors.lightBlueAccent.withOpacity(0.05),
                        //     Colors.lightBlueAccent.withOpacity(0.6)
                        //   ],
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        //   stops: [0.0, 0.39, 0.40, 1.0],
                        // ),
                        height: 150,
                        width: size.width - 20,
                        child: LineChart(mainData()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  width: (size.width - 60) / 2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: expenses[index]['color'],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              expenses[index]['icon'],
                              color: white,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              expenses[index]['cost'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })),
        ],
      ),
    );
  }
}
