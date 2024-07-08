// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shaxsiyhamyon/widgets/progress_bar.dart';

class Budget extends StatelessWidget {
  final double totalPrice;
  Budget({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  int monthBudgetLimit = 10000000;

  @override
  Widget build(BuildContext context) {
    double percentage = (totalPrice * 100 / monthBudgetLimit) > 100
        ? 100
        : totalPrice * 100 / monthBudgetLimit;
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
                        onPressed: () {},
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
