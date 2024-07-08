// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shaxsiyhamyon/widgets/edit_budget.dart';

import 'package:shaxsiyhamyon/widgets/progress_bar.dart';

class Budget extends StatefulWidget {
  final double totalPrice;
  Budget({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  int monthBudgetLimit = 10000000;

  void showBudget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EditBudget(
          monthBudgetLimit: monthBudgetLimit,
          editBudgetlim: editBudgetlim,
        );
      },
    );
  }

  void editBudgetlim(int newValue) {
    setState(() {
      monthBudgetLimit = newValue;
      print(newValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (widget.totalPrice * 100 / monthBudgetLimit) > 100
        ? 100
        : widget.totalPrice * 100 / monthBudgetLimit;
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 480,
        decoration: BoxDecoration(
          color: Color.fromRGBO(230, 240, 250, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Oylik byudjet:"),
                      TextButton.icon(
                        onPressed: () {
                          showBudget(context);
                        },
                        label: Text("$monthBudgetLimit so'm"),
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Text("${percentage.toStringAsFixed(0)}%"),
                ],
              ),
              ProgressBar(percentage: percentage)
            ],
          ),
        ),
      ),
    );
  }
}
