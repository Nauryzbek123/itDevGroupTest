import 'package:flutter/material.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/widgets/column_spacer.dart';
import 'package:test_proj/src/features/app/widgets/pinput.dart';

class otpVerificationCode extends StatefulWidget {
  final TextEditingController textEditingController;
  otpVerificationCode({required this.textEditingController});

  @override
  State<otpVerificationCode> createState() => _otpVerificationCodeState();
}

class _otpVerificationCodeState extends State<otpVerificationCode> {
  @override
  void dispose() {
    widget.textEditingController.dispose(); 
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          OnlyBottomCursor(
            controller: widget.textEditingController,
              ),
              ColumnSpacer(2),
               Text.rich(
  TextSpan(
    text: "Код не пришел?",
    style: TextStyle(
      fontSize: 12,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    ),
  ),
),
          ColumnSpacer(6),
        ],
      ),
    );
  }
}