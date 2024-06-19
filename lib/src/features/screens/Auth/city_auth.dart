import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/resources/manrope_text.dart';
import 'package:test_proj/src/core/resources/static_data.dart';
import 'package:test_proj/src/core/widgets/button_widget.dart';
import 'package:test_proj/src/core/widgets/column_spacer.dart';
import 'package:test_proj/src/core/widgets/row_spacer.dart';
import 'package:test_proj/src/features/app/router/router.gr.dart';

class CityAuth extends StatefulWidget {
  const CityAuth({Key? key}) : super(key: key);

  @override
  _CityAuthState createState() => _CityAuthState();
}

class _CityAuthState extends State<CityAuth> {
  String selectedCity = "Город";

  void updateSelectedCity(String city) {
    setState(() {
      selectedCity = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 2),
        child: Column(
          children: [
            AppBar(
              title: Column(
                children: [
                  Row(
                    children: [
                      RowSpacer(7),
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
            ColumnSpacer(16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.greyLineColor.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowSpacer(1),
                  Text(
                    selectedCity,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCitySelectionDialog(context, updateSelectedCity);
                    },
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
            ColumnSpacer(35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: ButtonWidget(
                onClick: () => AutoRouter.of(context).push(PhoneAuth()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCitySelectionDialog(
      BuildContext context, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            for (String city in cities)
              ListTile(
                title: Text(city),
                onTap: () {
                  onSelect(city);
                  Navigator.pop(context);
                },
              ),
          ],
        );
      },
    );
  }
}
