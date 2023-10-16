import 'package:flutter/material.dart';
import 'package:img_search_app/home.dart';

class Sidebar extends StatefulWidget {
  const Sidebar(
      {super.key, required this.selectedIndex, required this.selectedTitle});

  final int selectedIndex;
  final int selectedTitle;
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _expandedIndex = -1;
  int selected_index = -1;
  int selected_title = -1;

  // void _handleLogoutSuccess(BuildContext context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const LoginPage(),
  //     ),
  //   );
  // }

  void _handleExpansion(int index) {
    setState(() {
      _expandedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expandedIndex = widget.selectedIndex;
    selected_title = widget.selectedTitle;
    selected_index = widget.selectedIndex;
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: const Text('Thông báo'),
          content: const Text(
            'Bạn muống đăng xuất ?',
          ),
          actions: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0)),
              ),
              child: TextButton(
                child: const Text(
                  'Đóng',
                  style: TextStyle(color: Color.fromARGB(255, 18, 18, 18)),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng hộp thoại
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0)),
              ),
              child: TextButton(
                child: const Text(
                  'Đồng ý',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  // _handleLogoutSuccess(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 103, 102, 102))),
            child: ExpansionTile(
              key: UniqueKey(),
              onExpansionChanged: (bool isExpanded) {
                if (isExpanded) {
                  _handleExpansion(1);
                } else {
                  _handleExpansion(-1);
                }
              },
              initiallyExpanded: _expandedIndex == 1,
              title: TextButton(
                onPressed: () {
                  if (selected_index != 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Trang Chủ",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              trailing: const SizedBox(),
              shape: const CircleBorder(),
              leading: const Icon(Icons.home),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 103, 102, 102))),
            child: ExpansionTile(
              key: UniqueKey(),
              title: Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text("Tools")),
              onExpansionChanged: (bool isExpanded) {
                if (isExpanded) {
                  _handleExpansion(2);
                } else {
                  _handleExpansion(-1);
                }
              },
              initiallyExpanded: _expandedIndex == 2,
              shape: const CircleBorder(),
              leading: const Icon(Icons.inventory_2_rounded),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text("Image Search"),
                  selectedColor: const Color.fromARGB(255, 255, 33, 17),
                  selected: _expandedIndex == 2 && selected_title == 1,
                  onTap: () {
                    //action on press
                    if (selected_index != 2 && selected_title != 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                ),
                // ListTile(
                //   title: const Text("Chiến dịch tin nhắn"),
                //   onTap: () {
                //     //action on press
                //   },
                // ),
                // ListTile(
                //   title: const Text("Mẫu tin nhắn"),
                //   onTap: () {
                //     //action on press
                //   },
                // ),
                // ListTile(
                //   title: const Text("Đăng bài"),
                //   onTap: () {
                //     //action on press
                //   },
                // ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       border: Border.all(
          //           color: const Color.fromARGB(255, 103, 102, 102))),
          //   child: ExpansionTile(
          //     key: UniqueKey(),
          //     title: Container(
          //         padding: const EdgeInsets.only(left: 10),
          //         alignment: Alignment.centerLeft,
          //         child: const Text("Danh mục")),
          //     onExpansionChanged: (bool isExpanded) {
          //       if (isExpanded) {
          //         _handleExpansion(2);
          //       } else {
          //         _handleExpansion(-1);
          //       }
          //     },
          //     initiallyExpanded: _expandedIndex == 2,
          //     shape: const CircleBorder(),
          //     leading: const Icon(Icons.assignment),
          //     childrenPadding: const EdgeInsets.only(left: 60),
          //     children: [
          //       ListTile(
          //         title: const Text("Tài khoản mạng xã hội"),
          //         onTap: () {
          //           //action on press
          //         },
          //       ),
          //       ListTile(
          //         title: const Text("Khách hàng"),
          //         onTap: () {
          //           //action on press
          //         },
          //       ),
          //       ListTile(
          //         title: const Text("Sản Phầm"),
          //         onTap: () {
          //           //action on press
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       border: Border.all(
          //           color: const Color.fromARGB(255, 103, 102, 102))),
          //   child: ExpansionTile(
          //     key: UniqueKey(),
          //     title: Container(
          //         padding: const EdgeInsets.only(left: 10),
          //         alignment: Alignment.centerLeft,
          //         child: const Text(
          //           "Quản lý người dùng",
          //         )),
          //     onExpansionChanged: (bool isExpanded) {
          //       if (isExpanded) {
          //         _handleExpansion(3);
          //       } else {
          //         _handleExpansion(-1);
          //       }
          //     },
          //     initiallyExpanded: _expandedIndex == 3,
          //     shape: const CircleBorder(),
          //     leading: const Icon(Icons.co_present_sharp),
          //     childrenPadding: const EdgeInsets.only(left: 60),
          //     children: [
          //       ListTile(
          //         title: const Text("Người dùng"),
          //         onTap: () {
          //           //action on press
          //         },
          //       ),
          //       ListTile(
          //         title: const Text("Nhóm"),
          //         onTap: () {
          //           //action on press
          //         },
          //       ),
          //       ListTile(
          //         title: const Text("Phân quyền"),
          //         selected: _expandedIndex == 3 && selected_title == 3,
          //         onTap: () {},
          //       ),
          //       ListTile(
          //         title: const Text(
          //           "Quyền truy cập",
          //         ),
          //         selectedColor: Colors.green,
          //         selected: _expandedIndex == 3 && selected_title == 4,
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: const Text(
                    'Bạn muốn đăng xuất ?',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  onTap: () {
                    _showDialog(context);
                  },
                )),
          )
        ],
      ),
    );
  }
}
