import "package:flutter/material.dart";

class MinButton extends StatelessWidget {
  final Function() action;
  final String content;
  const MinButton({required this.content, required this.action});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          content,
          style: TextStyle(color: Colors.white.withOpacity(0.9)),
        ),
      ),
    );
  }
}
