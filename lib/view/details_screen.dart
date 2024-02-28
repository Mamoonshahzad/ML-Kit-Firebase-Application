import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class DetailsScreen extends StatefulWidget {
  final String item;

  const DetailsScreen({required this.item, super.key});

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  late File pickedImage;
  File? imageFile;
  bool isImageLoaded = false;

  getImageFromGallery() async {
    var tempStore = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
    });
  }

  readTextFromAnImage() async {
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer recognizeText = FirebaseVison.instance.textRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.item),
        actions: [
          ElevatedButton(
              onPressed: getImageFromGallery,
              child: const Icon(Icons.add_a_photo))
        ],
      ),
      body: Column(children: [
        const SizedBox(height: 100),
        isImageLoaded
            ? Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(pickedImage), fit: BoxFit.cover)),
                ),
              )
            : Container()
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}
