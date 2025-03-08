import 'package:flutter/material.dart';
import 'package:olx/view/core/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyShade.withAlpha(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find Cars, Mobile Phones and more...",
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 50, child: Icon(Icons.notifications_outlined)),
          ],
        ),
      ),
    );
  }
}
