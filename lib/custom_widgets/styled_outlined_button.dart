import 'package:flutter/material.dart';

class StyledOutlinedButton extends StatelessWidget {
  const StyledOutlinedButton(this.activescreen,
      {super.key, required this.text,
      this.customIcon = const Icon(Icons.arrow_right_alt)});
  final String text;
  final Icon customIcon;

  final void Function() activescreen;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        activescreen();
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      icon: customIcon,
      label: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
