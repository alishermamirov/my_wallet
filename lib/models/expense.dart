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
  required  this.icon ,
  });
}

class Expenses {
  List<Expense> _items = [
    Expense(id: "e1", title: "xarajat1", date: DateTime.now(), amount: 300000,icon: Icons.price_change),
    Expense(id: "e2", title: "xarajat2", date: DateTime.now(), amount: 5000000,icon: Icons.price_change),
    Expense(id: "e3", title: "xarajat3", date: DateTime.now(), amount: 800000,icon: Icons.price_change),
  ];

  List<Expense> get items {
    return _items;
  }

  void addExpense(String title, DateTime date, double amount, IconData icon) {
    _items.add(
      Expense(
        id: UniqueKey().toString(),
        title: title,
        date: date,
        amount: amount,
        icon:  icon,
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
