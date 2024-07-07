import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:shaxsiyhamyon/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Wallet"),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Header(
                  selectedDate: selectedDate,
                  showMonthPick: showMonthPick,
                  nextMonth: nextMonth,
                  previousMonth: previousMonth),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 480,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 240, 250, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
