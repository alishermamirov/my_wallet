import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 380,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(),
              title: Text("title"),
              subtitle: Text("sana"),
              trailing: Text("summa"),
            );
          },
        ),
      ),
    );
  }
}
