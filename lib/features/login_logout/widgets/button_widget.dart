import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orange[700]!,
            Colors.orange[400]!,
            //add more colors
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 4,
          ),
          onPressed: onPress,
          child: Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
