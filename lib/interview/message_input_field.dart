import 'package:flutter/material.dart';

class MessageInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onSubmitted;

  const MessageInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
  });

  @override
  // ignore: library_private_types_in_public_api
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              autofocus: true,
              minLines: 1,
              maxLines: widget.controller.text.length > 20 ? null : 1,
              onSubmitted: widget.onSubmitted,
              decoration: const InputDecoration(hintText: 'Enter message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (widget.controller.text.isNotEmpty) {
                widget.onSubmitted(widget.controller.text);
                widget.controller.clear();
                widget.focusNode.requestFocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
