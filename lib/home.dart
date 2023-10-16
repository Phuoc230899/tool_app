import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:async/async.dart';
import 'package:img_search_app/core/ApiService.dart';
import 'package:img_search_app/ui/image_search.dart';
import 'package:img_search_app/widget/nav_bar.dart';
import 'package:img_search_app/widget/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = const [
    Home(),
    ImageSearchScreen(),
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final Widget navbar = NavbarWidget(
      currentPage: _currentPage,
      onTabTapped: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: PageView(
            controller: _pageController,
            children: _pages,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color.fromARGB(255, 255, 33, 17),
              child:  Icon(
                Icons.add,
                size: 35.h,
              )),
          bottomNavigationBar: navbar),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Home Page"),
    );
  }
}
