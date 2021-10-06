// ignore_for_file: prefer_final_fields, sized_box_for_whitespace

import 'package:budget_tracker_linechart_ex_211005/json/create_budget_json.dart';
import 'package:budget_tracker_linechart_ex_211005/theme/colors.dart';
import 'package:flutter/material.dart';

class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({Key? key}) : super(key: key);

  @override
  _CreateBudgetPageState createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  int activeCategory = 0;
  TextEditingController _budgetName = TextEditingController(text: 'Shopping');
  TextEditingController _budgetCost = TextEditingController(text: '\$700.00');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Create Budget',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 28,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Choose category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: black.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        activeCategory = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: activeCategory == index
                                  ? primary
                                  : Colors.transparent,
                              width: activeCategory == index ? 2 : 0),
                          borderRadius: BorderRadius.circular(12),
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
                              left: 25, right: 25, bottom: 20, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: grey.withOpacity(0.15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    categories[index]['icon'],
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // const Spacer(),
                              Text(
                                categories[index]['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Budget name',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: black.withOpacity(0.6),
                  ),
                ),
                TextField(
                  controller: _budgetName,
                  cursorColor: primary,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Budget Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width - 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'enter budget',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: black.withOpacity(0.6),
                            ),
                          ),
                          TextField(
                            controller: _budgetCost,
                            cursorColor: primary,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Budget Cost',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: white,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
