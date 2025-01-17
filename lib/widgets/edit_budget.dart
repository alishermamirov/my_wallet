// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shaxsiyhamyon/widgets/adaptive_button.dart';

class EditBudget extends StatefulWidget {
  final int monthBudgetLimit;
  final Function editBudgetlim;
  const EditBudget({
    super.key,
    required this.monthBudgetLimit,
    required this.editBudgetlim,
  });

  @override
  State<EditBudget> createState() => _EditBudgetState();
}

class _EditBudgetState extends State<EditBudget> {
  late TextEditingController budgetController;

  @override
  void initState() {
    budgetController = TextEditingController();
    budgetController.text = widget.monthBudgetLimit.toString();
    super.initState();
  }

  @override
  void dispose() {
    budgetController.dispose();
    super.dispose();
  }

  void submit(BuildContext context) {
    if (budgetController.text.isNotEmpty &&
        int.parse(budgetController.text) > 0) {
      widget.editBudgetlim(int.parse(budgetController.text));
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
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Budget limit",
                border: OutlineInputBorder(),
              ),
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
