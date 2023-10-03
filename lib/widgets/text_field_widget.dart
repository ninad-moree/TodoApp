import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPasswordType;
  const TextInputWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isPasswordType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
        controller: controller,
        obscureText: isPasswordType,
        cursorColor: Colors.orange[600],
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ),
    );
  }
}
