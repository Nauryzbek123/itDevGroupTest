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
import 'package:test_proj/src/features/app/widgets/phone_input_widget.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthBloc.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthEvent.dart';
import 'package:test_proj/src/features/screens/Auth/logic/bloc/AuthState.dart';

class PhoneAuth extends StatelessWidget {
   PhoneAuth({super.key});

  final TextEditingController phoneController = TextEditingController();

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
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.blackColor,
                      ),
                      RowSpacer(
                          11), 
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
              elevation: 0,
              backgroundColor: Colors
                  .transparent, 
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
        create: (context) => getIt<PhoneAuthBloc>(),
        child: Center(
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
              PhoneInput(
                controller: phoneController,
              ),
              BlocConsumer<PhoneAuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is PhoneAuthSuccess) {
                    AutoRouter.of(context).push(SmsVerification(phoneNumber: phoneController.text));
                  } else if (state is PhoneAuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PhoneAuthLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: ButtonWidget(
                        onClick: () {
                          final phoneNum = phoneController.text;
                          context
                              .read<PhoneAuthBloc>()
                              .add(VerifyPhoneNumber(phoneNum));
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
