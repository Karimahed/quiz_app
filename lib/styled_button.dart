import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget{

  final String choice;
  final void Function() onTap;

  const StyledButton(this.choice, this.onTap,{super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xE4242478),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        )
      ),
      child: Text(
        choice,
        textAlign: TextAlign.center,
      ),
    );
  }

}