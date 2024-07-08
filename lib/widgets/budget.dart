import 'package:flutter/material.dart';
import 'package:shaxsiyhamyon/widgets/progress_bar.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Oylik byudjet:"),
                      TextButton.icon(
                        onPressed: () {},
                        label: Text("100,011 so'm"),
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Text("5.%"),
                ],
              ),
              ProgressBar()
            ],
          ),
        ),
      ),
    );
  }
}
