// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shaxsiyhamyon/models/expense.dart';
import 'package:shaxsiyhamyon/widgets/budget.dart';
import 'package:shaxsiyhamyon/widgets/expense_list.dart';

class Body extends StatelessWidget {
  final double totalPrice;
  final List<Expense> expenseItems;
  final Function deleteExpense;
  const Body({
    super.key,
    required this.totalPrice,
    required this.expenseItems,
    required this.deleteExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Budget(totalPrice:totalPrice),
        ExpenseList(expenseItems: expenseItems, deleteExpense: deleteExpense,),
      ],
    );
  }
}
