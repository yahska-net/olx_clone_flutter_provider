import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olx/controller/posts/post_provider.dart';
import 'package:olx/view/core/colors.dart';
import 'package:provider/provider.dart';

class FreshRecomendations extends StatelessWidget {
  const FreshRecomendations({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
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
        StreamBuilder(
          stream: postProvider.fetchProducts(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var products = snapshot.data!.docs;

            if (products.isEmpty) {
              return Center(child: Text("No products available"));
            }
            return Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              height: 280 * (products.length.toDouble() / 2),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  var product = products[index];

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
                              image: AssetImage(product["image"]),
                              fit: BoxFit.cover,
                              height: 130,
                            ),
                          ),
                          Text(
                            "₹${product["price"].toString()}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product["desc"],
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Icon(Icons.pin_drop_outlined, size: 15),
                              Text(product["location"]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
