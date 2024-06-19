import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/resources/manrope_text.dart';
import 'package:test_proj/src/core/widgets/button_widget.dart';
import 'package:test_proj/src/core/widgets/column_spacer.dart';
import 'package:test_proj/src/core/widgets/row_spacer.dart';
import 'package:test_proj/src/features/app/router/router.gr.dart';
import 'package:test_proj/src/features/app/widgets/phone_input_widget.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({super.key});

  @override
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
                        Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.blackColor,
                        ),
                        RowSpacer(
                            11), // Add spacing between the icon and the text
                        ManropeText(
                          "Авторизация",
                          16,
                          AppColors.blackColor,
                          FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
                elevation: 0, // Remove default shadow
                backgroundColor: Colors
                    .transparent, // Ensure background color matches with divider
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
                "Введите номер ",
                14,
                AppColors.blackColor,
                FontWeight.bold,
              ),
              ManropeText(
                "мобильного телефона",
                14,
                AppColors.blackColor,
                FontWeight.bold,
              ),
              ColumnSpacer(0.2),
              ManropeText(
                "Вам придет 4 значный код для",
                9,
                AppColors.NavItemGrey,
                FontWeight.w400,
              ),
              ManropeText(
                "подтверждение номера",
                9,
                AppColors.NavItemGrey,
                FontWeight.w400,
              ),
              PhoneInput(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: ButtonWidget(
                  onClick:  () => AutoRouter.of(context).push(SmsVerification())
                ),
              )
            ],
          ),
        )
        );
  }
}
