// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EditBudget extends StatefulWidget {
  final int monthBudgetLimit;
  final Function editBudgetlim;
  EditBudget({
    Key? key,
    required this.monthBudgetLimit,
    required this.editBudgetlim,
  }) : super(key: key);

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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Budget limit",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
