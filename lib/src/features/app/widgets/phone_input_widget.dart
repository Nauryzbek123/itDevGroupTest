import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';

class PhoneInput extends StatefulWidget {
    final TextEditingController controller;

  const PhoneInput({required this.controller,super.key});

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final TextEditingController _controller = TextEditingController(
    text: '+7(___)___-__-__',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+\s]')),
          PhoneInputFormatter(
            allowEndlessPhone: false,
          ),
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.whiteColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldGreyColor),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: AppColors.greyLineColor.withOpacity(0.4),
        ),
      ),
    );
  }
}
