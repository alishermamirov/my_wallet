import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:shaxsiyhamyon/models/expense.dart';
import 'package:shaxsiyhamyon/widgets/add_expense.dart';
import 'package:shaxsiyhamyon/widgets/body.dart';
import 'package:shaxsiyhamyon/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final expenses = Expenses();
  DateTime selectedDate = DateTime.now();

  void showMonthPick(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then(
      (value) => setState(() {
        if (value != null) {
          selectedDate = value;
        }
      }),
    );
  }

  void nextMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day,
      );
    });
  }

  void previousMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day,
      );
    });
  }

  void showAddExpanse(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AddExpense(addExpenses: addExpenses);
      },
    );
  }

  void addExpenses(String title, DateTime date, double amount) {
    setState(() {
      expenses.addExpense(title, date, amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice=expenses.totalPrice(selectedDate);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("My Wallet"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Header(
                totalPrice: totalPrice,
                selectedDate: selectedDate,
                showMonthPick: showMonthPick,
                nextMonth: nextMonth,
                previousMonth: previousMonth),
            Body(expenseItems: expenses.sortByMonth(selectedDate),totalPrice:totalPrice),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddExpanse(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
