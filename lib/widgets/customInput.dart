import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hint;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool isPassword;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  CustomInput({
    this.hint,
    this.controller,
    this.readOnly = false,
    this.inputType,
    this.isPassword = false,
    required this.textInputAction,
    this.onSubmitted,
 // Default isPassword to false
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _isObscured; // Define _isObscured as late

  @override
  void initState() {
    super.initState();
    // Initialize _isObscured based on isPassword parameter
    _isObscured = widget.isPassword;
  }

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
      child: TextFormField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        autofocus: true,
        keyboardType: widget.inputType,
        obscureText: _isObscured,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: InputBorder.none,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
              : null, // No suffixIcon when it's not a password field
        ),
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onSubmitted,

      ),
    );
  }
}