// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shaxsiyhamyon/widgets/edit_budget.dart';

import 'package:shaxsiyhamyon/widgets/progress_bar.dart';

class Budget extends StatefulWidget {
  final double totalPrice;
  const Budget({
    super.key,
    required this.totalPrice,
  });

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  int monthBudgetLimit = 10000000;

  void showBudget(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
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
    });
  }

  @override
  Widget build(BuildContext context) {
    double percentage = (widget.totalPrice * 100 / monthBudgetLimit) > 100
        ? 100
        : widget.totalPrice * 100 / monthBudgetLimit;
    return LayoutBuilder(builder: (context, constrains) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: constrains.maxHeight,
        decoration: const BoxDecoration(
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
                      const Text("Oylik byudjet:"),
                      TextButton.icon(
                        onPressed: () {
                          showBudget(context);
                        },
                        label: Text("$monthBudgetLimit so'm"),
                        icon: const Icon(Icons.edit),
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
      );
    });
  }
}
