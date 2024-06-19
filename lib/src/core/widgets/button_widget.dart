import 'package:flutter/material.dart';
import 'package:test_proj/src/core/resources/app_colors.dart';
import 'package:test_proj/src/core/resources/manrope_text.dart';
import 'package:test_proj/src/core/widgets/row_spacer.dart';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onClick;

  const ButtonWidget({
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.orange, 
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Далее",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white, // Icon color
            ),
          ],
        ),
      ),
    );
  }
}

