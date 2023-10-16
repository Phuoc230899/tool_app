import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget(
      {super.key, required this.currentPage, required this.onTabTapped});

  final int currentPage;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        height: 50.0.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.0.h,
              width: MediaQuery.of(context).size.width / 2 - 40.0.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined),
                    onPressed: () => onTabTapped(0),
                    color: currentPage == 0
                        ? const Color.fromARGB(255, 255, 33, 17)
                        : Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: () => onTabTapped(1),
                    color: currentPage == 1
                        ? const Color.fromARGB(255, 255, 33, 17)
                        : Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0.h,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    color: Color(0xFF676E79),
                  ),
                  Icon(
                    Icons.bookmark_outline_outlined,
                    color: Color(0xFF676E79),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
