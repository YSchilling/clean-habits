import 'package:flutter/material.dart';

class WeekProgressBar extends StatelessWidget {
  const WeekProgressBar({super.key});

  Widget _createDay(String day) {
    return Column(
      children: [
        Text(day),
        const SizedBox(height: 8.0),
        const CircularProgressIndicator(value: 1.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _createDay("Mon"),
          _createDay("Tue"),
          _createDay("Wed"),
          _createDay("Thu"),
          _createDay("Fri"),
          _createDay("Sat"),
          _createDay("Sun"),
        ],
      ),
    );
  }
}
