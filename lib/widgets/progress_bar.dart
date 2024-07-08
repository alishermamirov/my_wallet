import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(212, 219, 239, 1),
      ),
      child: AnimatedFractionallySizedBox(
        duration: Duration(milliseconds: 500),
        heightFactor: 2,
        widthFactor: 0.5,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.blue,
                Colors.blue.shade100,
                Colors.blue,
              ]),
              boxShadow: [
                BoxShadow(
                    color: Colors.blue,
                    blurRadius: 6,
                    spreadRadius: -2)
              ]),
        ),
      ),
    );
  }
}
