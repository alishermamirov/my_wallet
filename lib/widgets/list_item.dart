// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shaxsiyhamyon/models/expense.dart';

class ListItem extends StatelessWidget {
  final Expense expense;
  const ListItem({
    Key? key,
    required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(expense.icon),
      ),
      title: Text(expense.title),
      subtitle: Text(DateFormat("d, MMMM, y").format(expense.date)),
      trailing: Text("${expense.amount} so'm"),
    );
  }
}
