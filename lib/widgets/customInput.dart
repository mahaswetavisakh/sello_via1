import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {

  final String? hint;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Widget? firstSuffixWidget;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;

  CustomInput({
    this.hint,
    this.controller,
    this.readOnly = false,
    this.inputType,
    this.firstSuffixWidget,
    this.textInputAction,
    this.onSubmitted,
    this.obscureText = false,

  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 500,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFE1E1E1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(

              readOnly: widget.readOnly,
              controller: widget.controller,
              autofocus: true,
              keyboardType: widget.inputType,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                hintText: widget.hint,
                border: InputBorder.none,
                // No suffixIcon when it's not a password field
              ),
              textInputAction: widget.textInputAction,
              onFieldSubmitted: widget.onSubmitted,
            ),
          ),
          if (widget.firstSuffixWidget != null) widget.firstSuffixWidget!,

        ],
      ),
    );
  }
}