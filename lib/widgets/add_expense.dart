// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function addExpenses;

  const AddExpense({
    Key? key,
    required this.addExpenses,
  }) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? selectedDate;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void showDatePick(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value != null) {
          setState(() {
            selectedDate = value;
          });
        }
      },
    );
  }

  void submit(BuildContext context) {
    if (titleController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        double.parse(amountController.text) > 0 &&
        selectedDate != null) {
      widget.addExpenses(
        titleController.text,
        selectedDate,
        double.parse(amountController.text),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 10
              : 50),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Harajat nomi",
                ),
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Harajat miqdori",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedDate == null
                    ? "Sana tanlanmagan"
                    : DateFormat("d, MMMM, y").format(selectedDate!)),
                TextButton(
                  onPressed: () {
                    showDatePick(context);
                  },
                  child: Text("Sana tanlash"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ikonka tanlanmagan"),
                TextButton(
                  onPressed: () {},
                  child: Text("ikonka tanlash"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Bekor qilish"),
                ),
                ElevatedButton(
                  onPressed: () {
                    submit(context);
                  },
                  child: Text("Saqlash"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
