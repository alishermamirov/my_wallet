import 'dart:io';

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
  bool _showExpensseList = false;
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

  void addExpenses(String title, DateTime date, double amount, IconData icon) {
    setState(() {
      expenses.addExpense(title, date, amount, icon);
    });
  }

  void deleteExpense(String id) {
    setState(() {
      expenses.deleteExpense(id);
    });
  }

  void toggleSwitch() {
    setState(() {
      _showExpensseList = !_showExpensseList;
    });
  }

  Widget _showPortrait(
      double totalPrice, double devicHeight, double deviceWidth) {
    return Column(
      children: [
        SizedBox(
          height: devicHeight * 0.2,
          width: deviceWidth,
          child: Header(
            totalPrice: totalPrice,
            selectedDate: selectedDate,
            showMonthPick: showMonthPick,
            nextMonth: nextMonth,
            previousMonth: previousMonth,
          ),
        ),
        SizedBox(
          height: devicHeight * 0.8,
          width: deviceWidth,
          child: Body(
            expenseItems: expenses.sortByMonth(selectedDate),
            totalPrice: totalPrice,
            deleteExpense: deleteExpense,
          ),
        ),
      ],
    );
  }

  Widget _showLandscape(
      double totalPrice, double devicHeight, double deviceWidth) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ro'yxatni ko'rsatish",
                style: TextStyle(fontSize: 18),
              ),
              Switch.adaptive(
                value: _showExpensseList,
                onChanged: (value) {
                  toggleSwitch();
                },
              ),
            ],
          ),
          _showExpensseList
              ? SizedBox(
                  height: devicHeight,
                  width: deviceWidth,
                  child: Body(
                    expenseItems: expenses.sortByMonth(selectedDate),
                    totalPrice: totalPrice,
                    deleteExpense: deleteExpense,
                  ),
                )
              : SizedBox(
                  height: devicHeight,
                  width: deviceWidth,
                  child: Header(
                    totalPrice: totalPrice,
                    selectedDate: selectedDate,
                    showMonthPick: showMonthPick,
                    nextMonth: nextMonth,
                    previousMonth: previousMonth,
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = expenses.totalPrice(selectedDate);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appbar = AppBar(
      title: const Text("My Wallet"),
      centerTitle: true,
      actions: [
        Platform.isIOS
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            : Container(),
      ],
    );
    double devicHeight = MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: isLandscape
            ? _showLandscape(totalPrice, devicHeight, deviceWidth)
            : _showPortrait(totalPrice, devicHeight, deviceWidth),
      ),
      floatingActionButton: Platform.isAndroid
          ? FloatingActionButton(
              onPressed: () {
                showAddExpanse(context);
              },
              child: const Icon(Icons.add),
            )
          : Container(),
    );
  }
}
