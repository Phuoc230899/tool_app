import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img_search_app/core/ApiService.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  XFile? image;

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            SizedBox(
              width: 200.w,
              height: 200.h,
              child: CustomPaint(
                  painter: image == null ? DottedBorderPainter() : null,
                  child: Center(
                    child: image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () => myAlert(),
                                    child: Image.asset(
                                        'assets/images/upload_image.png'),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () => myAlert(),
                                    child: const Text(
                                      "Choose an image",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ))
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              fit: BoxFit.cover,
                              width: 200.w,
                              height: 200.h,
                            ),
                          ),
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                ApiService.upload(image as XFile);
              },
              child: const Text('Send Api'),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black // Màu của đường viền
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Độ dày của đường viền

    final double spacing = 5; // Khoảng cách giữa các đoạn chấm
    final double dashLength = 5; // Chiều dài của mỗi đoạn chấm

    for (double i = 0; i < size.width; i += spacing + dashLength) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + dashLength, 0),
        paint,
      );
      canvas.drawLine(
        Offset(i, size.height),
        Offset(i + dashLength, size.height),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += spacing + dashLength) {
      canvas.drawLine(
        Offset(0, i),
        Offset(0, i + dashLength),
        paint,
      );
      canvas.drawLine(
        Offset(size.width, i),
        Offset(size.width, i + dashLength),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
