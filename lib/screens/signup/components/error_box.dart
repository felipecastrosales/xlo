import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    } else {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.0),  
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 40),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                'Ooops! $message. Por favor, tente novamente.',
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
