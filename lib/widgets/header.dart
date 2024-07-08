// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final Function showMonthPick;
  final Function() nextMonth;
  final Function() previousMonth;
  final DateTime selectedDate;
  final double totalPrice;
  const Header({
    Key? key,
    required this.showMonthPick,
    required this.nextMonth,
    required this.previousMonth,
    required this.selectedDate,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            showMonthPick(context);
          },
          child: Text(
            DateFormat("MMMM, y").format(selectedDate),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: selectedDate.year == DateTime(2023).year
                  ? null
                  : previousMonth,
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  totalPrice.toStringAsFixed(0),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
                ),
                Text(
                  "so'm",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20, height: 0.5),
                ),
              ],
            ),
            IconButton(
              onPressed: selectedDate.year == DateTime.now().year &&
                      selectedDate.month == DateTime.now().month
                  ? null
                  : nextMonth,
              icon: Icon(
                Icons.chevron_right_rounded,
                size: 40,
              ),
            ),
          ],
        )
      ],
    );
  }
}
