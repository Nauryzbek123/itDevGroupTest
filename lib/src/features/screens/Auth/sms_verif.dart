import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/src/core/dependencies/getIt.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/resources/manrope_text.dart';
import 'package:test_proj/src/core/widgets/button_widget.dart';
import 'package:test_proj/src/core/widgets/column_spacer.dart';
import 'package:test_proj/src/core/widgets/row_spacer.dart';
import 'package:test_proj/src/features/app/router/router.gr.dart';
import 'package:test_proj/src/features/app/widgets/otp_ver_widget.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthBloc.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthEvent.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthState.dart';

class SmsVerification extends StatefulWidget {
  final String phoneNumber;

  const SmsVerification({super.key, required this.phoneNumber});

  @override
  State<SmsVerification> createState() => _SmsVerificationState();
}

class _SmsVerificationState extends State<SmsVerification> {
  final TextEditingController pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight + 2), 
        child: Column(
          children: [
            AppBar(
              title: Column(
                children: [
                  Row(
                    children: [
                      RowSpacer(8),
                      ManropeText(
                        "Регистрация",
                        16,
                        AppColors.blackColor,
                        FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: AppColors.greyLineColor, 
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => PhoneAuthBloc([], []),
        child: BlocConsumer<PhoneAuthBloc, AuthState>(
          listener: (context, state) {
            if (state is OtpVerificationSuccess) {
              AutoRouter.of(context).push(CityAuth());
            } else if (state is PhoneAuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColumnSpacer(7),
                  ManropeText(
                    "Мы отправили вам 4 значный",
                    14,
                    AppColors.blackColor,
                    FontWeight.bold,
                  ),
                  ManropeText(
                    "код введите его в поле",
                    14,
                    AppColors.blackColor,
                    FontWeight.bold,
                  ),
                  ColumnSpacer(0.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ManropeText(
                        "на номер ",
                        9,
                        AppColors.NavItemGrey,
                        FontWeight.w400,
                      ),
                      ManropeText(
                        widget.phoneNumber,
                        9,
                        AppColors.OrangeText,
                        FontWeight.w400,
                      ),
                    ],
                  ),
                  ColumnSpacer(6),
                  otpVerificationCode(
                    textEditingController: pinputController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: state is PhoneAuthLoading
                        ? CircularProgressIndicator()
                        : ButtonWidget(
                            onClick: () {
                              final otpText = pinputController.text;
                              print(
                                  "OTP Text: $otpText");

                              if (otpText.length == 4 &&
                                  RegExp(r'^\d{4}$').hasMatch(otpText)) {
                                final otp = int.tryParse(otpText);
                                if (otp != null) {
                                  print(
                                      "Parsed OTP: $otp"); 
                                  context.read<PhoneAuthBloc>().add(
                                        VerifyOtp(widget.phoneNumber, otp),
                                      );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Invalid OTP format')),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid OTP format')),
                                );
                              }
                            },
                          ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
