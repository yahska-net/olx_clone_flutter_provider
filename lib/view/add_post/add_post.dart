import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Post")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Product Name"),
            ),
            SizedBox(height: 10),
            TextFormField(
              minLines: 3,
              maxLines: 7,
              decoration: InputDecoration(hintText: "Description"),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Price"),
            ),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(hintText: "Location")),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(hintText: "Image")),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Text(
                  "Add Post",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
