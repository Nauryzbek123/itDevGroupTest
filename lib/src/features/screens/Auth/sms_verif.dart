import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/resources/manrope_text.dart';
import 'package:test_proj/src/core/widgets/button_widget.dart';
import 'package:test_proj/src/core/widgets/column_spacer.dart';
import 'package:test_proj/src/core/widgets/row_spacer.dart';
import 'package:test_proj/src/features/app/router/router.gr.dart';
import 'package:test_proj/src/features/app/widgets/otp_ver_widget.dart';

class SmsVerification extends StatefulWidget {
  const SmsVerification({super.key});

  @override
  State<SmsVerification> createState() => _SmsVerificationState();
}

class _SmsVerificationState extends State<SmsVerification> {
  final TextEditingController pinputController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              kToolbarHeight + 2), // Custom height including the divider height
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
                color: AppColors.greyLineColor, // Divider color
              ),
            ],
          ),
        ),
        body: Center(
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
                    "87076055050",
                    9,
                    AppColors.OrangeText,
                    FontWeight.w400,
                  ),
                ],
              ),
              ColumnSpacer(6),
              otpVerificationCode(
                controller: pinputController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: ButtonWidget(
                  onClick: () => AutoRouter.of(context).push(CityAuth())
                  ),
              )
            ],
          ),
        ));
  }
}
