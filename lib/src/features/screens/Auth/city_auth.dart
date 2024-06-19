import 'package:flutter/material.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/resources/manrope_text.dart';
import 'package:test_proj/src/core/widgets/column_spacer.dart';
import 'package:test_proj/src/core/widgets/row_spacer.dart';

class CityAuth extends StatelessWidget {
  const CityAuth({super.key});

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
                        
                        RowSpacer(
                            7), 
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
                "Выберите ваш город ",
                14,
                AppColors.blackColor,
                FontWeight.bold,
              ),
            ],
          ),
        )
        );
  }
}
