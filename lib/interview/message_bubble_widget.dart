import 'package:flutter/material.dart';
import 'package:interv_you/global/colors.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    this.isOwnMessage = false,
  });

  final String message;
  final bool isOwnMessage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOwnMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isOwnMessage
                  ? AppColors.secondaryColor
                  : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
