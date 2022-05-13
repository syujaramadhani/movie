import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie/screens/home/home_screen.dart';
import 'package:movie/screens/profile/profile_screen.dart';
import 'package:movie/screens/televesion/televesion_screen.dart';

class MenuTab extends StatefulWidget {
  final int tab;
  // ignore: use_key_in_widget_constructors
  const MenuTab(this.tab);

  @override
  // ignore: unnecessary_this
  _MenuTabState createState() => _MenuTabState(this.tab);
}

class _MenuTabState extends State<MenuTab> {
  late DateTime currentBackPressTime;
  int _selectedIndex = 0;
  late int tab;

  _MenuTabState(this.tab);

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    // ignore: unnecessary_null_comparison
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) >
            const Duration(
              seconds: 2,
            )) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Tekan tombol kembali lagi untuk keluar",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    _onItemTapped(tab);
    super.initState();
  }

  final _widgetOptions = [
    HomeScreen(),
    TelevisionScreen(),
    //HomeScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: SizedBox(
        //   width: 50.0,
        //   height: 50.0,
        //   child: buttonRaisedIcon(
        //     Icon(
        //       Icons.add,
        //       color: PariColor.white,
        //     ),
        //     bgColor: PariColor.sky,
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => CreateRequestScreen(),
        //         ),
        //       );
        //     },
        //     paddingVertical: 10.0,
        //     paddingHorizontal: 0.0,
        //   ),
        // ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              15.0,
            ),
            topRight: Radius.circular(
              15.0,
            ),
          ),
          child: BottomAppBar(
            color: Colors.black,
            notchMargin: 1.0,
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              showSelectedLabels: false, // <-- HERE
              showUnselectedLabels: false, // <-- AND HER
              selectedItemColor: Colors.deepPurpleAccent,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.ondemand_video),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.person,
                //     color: PariColor.white,
                //   ),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
