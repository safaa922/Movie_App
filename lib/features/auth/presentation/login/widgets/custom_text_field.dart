import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?) validator;
  final Widget icon;
  final FontWeight? fontWeight;
  final Color shadowColor;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    required this.validator,
    required this.icon,
    this.fontWeight,
    required this.shadowColor,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF8E4C).withOpacity(0.35),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: widget.isPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Color(0xFFFF8945),
                    blurRadius: 20,
                  ),
                ],
              ),
              validator: (value) {
                final error = widget.validator(value);

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      errorText = error;
                    });
                  }
                });

                return error;
              },
              onChanged: (value) {
                widget.onChanged?.call(value);

                final error = widget.validator(value);
                setState(() {
                  errorText = error;
                });
              },
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  height: 0,
                  fontSize: 0,
                ),
                filled: true,
                fillColor: const Color(0xFF221D33),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 13),
                  child: widget.icon,
                ),
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: 15.3,
                  color: Colors.white,
                  fontWeight: widget.fontWeight,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFFFF8E4C),
                    width: 1.6,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFFFF8E4C),
                    width: 1.6,
                  ),
                ),
              ),
            ),
          ),
          CustomErrorText(errorText: errorText),
        ],
      ),
    );
  }
}

class CustomErrorText extends StatelessWidget {
  final String? errorText;

  const CustomErrorText({
    super.key,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 20,
      child: errorText == null
          ? const SizedBox()
          : Padding(
        padding: const EdgeInsets.only(left: 12, top: 3),
        child: Text(
          errorText!,
          style: const TextStyle(
            color: Colors.redAccent,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}