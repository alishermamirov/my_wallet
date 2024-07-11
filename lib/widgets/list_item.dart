// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shaxsiyhamyon/models/expense.dart';

class ListItem extends StatelessWidget {
  final Expense expense;
  final Function deleteExpense;
  const ListItem({
    Key? key,
    required this.expense,
    required this.deleteExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
onDismissed: (direction) {
  deleteExpense(expense.id);
},
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child:  Icon(Icons.delete,color: Colors.red,)),
      key: ValueKey(expense.id),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(expense.icon),
        ),
        title: Text(expense.title),
        subtitle: Text(DateFormat("d, MMMM, y").format(expense.date)),
        trailing: Text("${expense.amount} so'm"),
      ),
    );
  }
}
