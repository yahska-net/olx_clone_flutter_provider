import 'package:flutter/material.dart';
import 'package:olx/controller/posts/post_provider.dart';
import 'package:provider/provider.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});

  final GlobalKey<FormState> postKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController(
    text: "Samsung S25",
  );
  final TextEditingController _descController = TextEditingController(
    text: "Good Condition",
  );
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController(
    text: "Palakkad",
  );
  final TextEditingController _imageController = TextEditingController(
    text: "lib/view/assets/images/buy_drone.jpeg",
  );

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Add Post")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: postKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter product name.';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Product Name"),
              ),
              SizedBox(height: 10),
              TextFormField(
                minLines: 3,
                maxLines: 7,
                controller: _descController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Description.';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Description"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter price.';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Price"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter location.';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Location"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _imageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter image.';
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Image"),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child:
                    postProvider.isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                          onPressed: () async {
                            if (postKey.currentState!.validate()) {
                              postProvider.addPost(
                                _nameController.text.trim(),
                                _descController.text.trim(),
                                double.parse(_priceController.text.trim()),
                                _locationController.text.trim(),
                                _imageController.text.trim(),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          child: Text(
                            "Add Post",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
