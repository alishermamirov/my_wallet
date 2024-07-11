// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shaxsiyhamyon/models/expense.dart';
import 'package:shaxsiyhamyon/widgets/list_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenseItems;
  final Function deleteExpense;

  const ExpenseList({
    Key? key,
    required this.expenseItems,
    required this.deleteExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 380,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: expenseItems.length > 0
              ? ListView.builder(
                  itemCount: expenseItems.length,
                  itemBuilder: (context, index) {
                    return ListItem(expense: expenseItems[index], deleteExpense: deleteExpense,);
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Xarajat yo'q",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/money-bag.png",
                        width: 200,
                      )
                    ],
                  ),
                )),
    );
  }
}
