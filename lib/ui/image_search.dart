import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img_search_app/core/ApiService.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  XFile? image;

  final ImagePicker picker = ImagePicker();
  final limit = TextEditingController();
  final score = TextEditingController();
  final MultiSelectController _controller = MultiSelectController();
  final List<ValueItem> _selectedOptions = [];
  // String category = 'thoitrang';
  // List<String> items = ['thoitrang', 'dochoimevabe','bachhoa'];

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    limit.text = '5';
    score.text = '2';
  }

  @override
  void dispose() {
    limit.dispose();
    score.dispose();
    super.dispose();
  }

  // void getCategory(value)
  // {
  //   setState(() {
  //     category = value;
  //   });
  // }

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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Image Search',
                      style: TextStyle(
                          fontSize: 20.h, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.search_outlined),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.h,
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.center,
                                            child: Text('Score')),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 50.w,
                                              height: 20.h,
                                              color: Colors.white,
                                              child: TextField(
                                                controller: score,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1),
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.center,
                                            child: Text('Limit')),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 50.w,
                                              height: 20.h,
                                              color: Colors.white,
                                              child: TextField(
                                                controller: limit,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                decoration:
                                                    const InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1),
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Category')),
                            SizedBox(
                              height: 5.h,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: MultiSelectDropDown(
                                  showClearIcon: true,
                                  controller: _controller,
                                  selectedOptionBackgroundColor: Colors.red,
                                  showChipInSingleSelectMode: true,
                                  onOptionSelected: (options) {
                                    debugPrint(options.toString());
                                  },
                                  chipConfig: const ChipConfig(
                                      wrapType: WrapType.wrap,
                                      labelColor: Colors.black,
                                      labelStyle: TextStyle(
                                        fontSize: 13,
                                      )),
                                  options: const <ValueItem>[
                                    ValueItem(
                                        label: 'Thời trang',
                                        value: 'thoitrang'),
                                    ValueItem(
                                        label: 'Đồ chơi, Mẹ và bé',
                                        value: 'dochoimevabe'),
                                    ValueItem(label: 'Option 3', value: '3'),
                                    ValueItem(label: 'Option 4', value: '4'),
                                    ValueItem(label: 'Option 5', value: '5'),
                                    ValueItem(label: 'Option 6', value: '6'),
                                  ],
                                  maxItems: 10,
                                  selectionType: SelectionType.multi,
                                  dropdownHeight: 200.h,
                                  optionTextStyle: const TextStyle(
                                      fontSize: 13, color: Colors.black),
                                  selectedOptionIcon:
                                      const Icon(Icons.check_circle),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 400.w,
                                  height: 200.h,
                                  child: CustomPaint(
                                      painter: image == null
                                          ? DottedBorderPainter()
                                          : null,
                                      child: Center(
                                        child: image == null
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ))
                                                ],
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                        )
                      ],
                    )),
              ],
            ),
          )
        ])
      ]),
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
