import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shop_ui/presentation/widgets/category_widget.dart';
import 'package:shop_ui/presentation/widgets/home_widget.dart';

class HomePage extends StatefulWidget{
  HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

ValueNotifier<int> _bottomTabIdx = ValueNotifier<int>(0);
@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      backgroundColor: const Color(0xff08150D),
      body: ValueListenableBuilder(
        valueListenable: _bottomTabIdx, 
        builder: (BuildContext context, int value,Widget? child){
          switch(value) {
            case 0:
            return SafeArea(
              child: HomeWidget(),
            );
               case 1:
                return SafeArea(
                  child: CategoryWidget(),
                );
              case 2:
                return SafeArea(
                  child: Container(
                    child: Center(
                      child:Text(
                        "Page 3",
                        style: TextStyle(color: Colors.white),
                        ),
                      ),
                  ),
                );
              case 3:
                return SafeArea(
                  child: Container(
                    child: Center(
                      child: Text("Page 4",
                      style: TextStyle(color: Colors.white
                      ),
                      ),
                    ),
                  ),
                );
                default: 
                return SafeArea(
                  child:Container(
                    child: Center(
                      child:Text(
                        "Page 4",
                        style: TextStyle(color: Colors.white),
                        ),
                  ),
                 ),
                );
          }
        },
        ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _bottomTabIdx, 
        builder: (context,value,child){
          return BottomNavigationBar(
          onTap: (idx){
            _bottomTabIdx.value = idx;
          },
          currentIndex: value,
          backgroundColor: const Color(0xff08150D),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.flutter_dash_outlined),
                    label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          ],
          );
        }
        ),
    );
  }

}