import 'package:flutter/material.dart';
import 'package:shaxsiyhamyon/widgets/budget.dart';
import 'package:shaxsiyhamyon/widgets/expense_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
         Budget(),ExpenseList(),
        
        ],
      ),
    );
  }
}
