import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Screens
import 'package:interioro_casa/screens/design/designideas.dart';
import 'package:interioro_casa/screens/home/first_page.dart';
import 'package:interioro_casa/screens/let_begin/let_begin.dart';
import 'package:interioro_casa/screens/magazine/magazine.dart';
import 'package:interioro_casa/screens/menu/menu.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [const FirstPage(),const DesignIdeas(),const LetsBegin(),const Magazine(),const Menu()];
  // int active_image = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          "Interioro.Casa",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: screens[index],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (_index){setState(() {
          index = _index;
        });},
        items: const[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house,),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services_outlined),
            activeIcon: Icon(Icons.design_services),
            label: "Design Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_outlined),
            activeIcon: Icon(Icons.camera),
            label: "Let's Begin",),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            activeIcon: Icon(Icons.video_collection_rounded),
            label: "Magazine"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            activeIcon: Icon(Icons.menu),
            label: "Menu"
          ),
        ],
      ),
    );
  }



}




