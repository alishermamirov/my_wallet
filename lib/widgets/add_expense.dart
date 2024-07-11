import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:intl/intl.dart';
import 'package:shaxsiyhamyon/widgets/adaptive_button.dart';
import 'package:shaxsiyhamyon/widgets/adaptive_textfield.dart';

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
  IconData? _selectedIcon;
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

  void showIcons(BuildContext context) {
    showIconPicker(
      context,
      iconPackModes: [IconPack.allMaterial, IconPack.cupertino],
    ).then(
      (value) {
        setState(() {
          if (value != null) {
            _selectedIcon = value;
          }
        });
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
        _selectedIcon,
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
              child: AdaptiveTextfield(
                controller: titleController,
                title: "Harajat nomi",
                keyType: TextInputType.name,
              ),
            ),
            AdaptiveTextfield(
              controller: amountController,
              title: "Harajat miqdori",
              keyType: TextInputType.number,
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
                _selectedIcon == null
                    ? Text("Ikonka tanlanmagan")
                    : Icon(_selectedIcon),
                TextButton(
                  onPressed: () => showIcons(context),
                  child: Text("ikonka tanlash"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdaptiveButton(
                    submit: () {
                      Navigator.of(context).pop();
                    },
                    title: "Bekor qilish"),
                AdaptiveButton(
                  filled: true,
                  submit: submit,
                  title: "Saqlash",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
