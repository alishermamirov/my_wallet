import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.price_change_sharp,
  });
}

class Expenses {
  List<Expense> _items = [
    Expense(id: "e1", title: "xarajat1", date: DateTime.now(), amount: 783287),
    Expense(id: "e2", title: "xarajat2", date: DateTime.now(), amount: 7857785),
    Expense(id: "e3", title: "xarajat3", date: DateTime.now(), amount: 57858),
  ];

  List<Expense> get items {
    return _items;
  }

  void addExpense(String title, DateTime date, double amount) {
    _items.add(
      Expense(
        id: UniqueKey().toString(),
        title: title,
        date: date,
        amount: amount,
      ),
    );
  }

  List<Expense> sortByMonth(DateTime date) {
    return _items
        .where(
          (element) =>
              element.date.month == date.month &&
              element.date.year == date.year,
        )
        .toList();
  }

  double totalPrice(DateTime date) {
    final sortItems = sortByMonth(date);
    return sortItems.fold(
      0,
      (previousValue, element) {
        return previousValue + element.amount;
      },
    );
  }

  void deleteExpense(String id) {
    _items.removeWhere((element) => element.id == id);
  }
}
