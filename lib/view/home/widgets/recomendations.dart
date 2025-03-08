import 'package:flutter/material.dart';
import 'package:olx/models/test_common/recomendations_models.dart';
import 'package:olx/view/core/colors.dart';

class FreshRecomendations extends StatelessWidget {
  const FreshRecomendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          color: Colors.white,
          child: Text(
            "Fresh Recomendations",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          height: 700,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: recomendations.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.1,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.greyShade),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(recomendations[index]["image"]),
                          fit: BoxFit.cover,
                          height: 130,
                        ),
                      ),
                      Text(
                        "₹${recomendations[index]["price"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        recomendations[index]["text"],
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          Icon(Icons.pin_drop_outlined, size: 15),
                          Text(recomendations[index]["location"]),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
