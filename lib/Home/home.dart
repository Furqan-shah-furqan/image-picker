import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            selectedImage != null
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    height: 500,
                    width: 350,
                    child: Expanded(
                        child: Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                    )))
                : Center(child: Text('Please Select an Image')),

            // pickImageFromGallery
            mybuttons(() {
              pickImageFromGallery();
            }, "Pick Image From Gallery", Colors.blue.shade100),
            SizedBox(height: 40),
            //  pickImageFromCamera
            mybuttons(() {
              pickImageFromCamera();
            }, "Pick Image From Camera", Colors.red.shade300),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  MaterialButton mybuttons(
      void Function()? onPressed, String text, Color color) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(18),
      color: color,
      onPressed: onPressed,
      child: Text(text),
    );
  }

  void pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  void pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }
}
