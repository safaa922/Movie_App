import 'package:flutter/material.dart';

class CustomSignupTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final FormFieldValidator validator;
  final Icon;
  final FontWeight;
  final ValueChanged<String>? onChanged;
  final shadowColor;

  const CustomSignupTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false, required this.validator,required this.Icon, this.FontWeight, required this.shadowColor, this.onChanged,
  });

  @override
  State<CustomSignupTextField> createState() => _CustomSignupTextFieldState();
}

class _CustomSignupTextFieldState extends State<CustomSignupTextField> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),

            ),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              obscureText: widget.isPassword,
              style: const TextStyle(
                  color: Color(0xFF8C82FF),
                  shadows: [
                    Shadow(color: Color(0xFF8C82FF),offset: Offset(0, 0),blurRadius: 20)
                  ]
              ),
              onChanged: (value) {
                widget.onChanged?.call(value);

                final error = widget.validator(value);
                setState(() {
                  errorText = error;
                });
              },
              validator: (val){
                final error= widget.validator(val);
                WidgetsBinding.instance.addPostFrameCallback((_){
                  if(mounted){
                    setState(() {
                      errorText = error;
                    });
                  }
                });
                return error;
              },

              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                errorStyle: const TextStyle(
                  height: 0,
                  fontSize: 0,
                ),
                isDense: true,
                filled: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 13),
                  child: widget.Icon,
                ),
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: 15.3,
                  color: Color(0xFFCBC8FF),
                  fontWeight: widget.FontWeight,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color:  Color(0xFFA8A1FF),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFF8C82FF),
                    width: 2.5,
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
                    color: Color(0xFF465FFF),
                    width: 1.6,
                  ),
                ),
              ),

            ),
          ),
          CustomErrorText(errorText: errorText),
        ],
      )

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