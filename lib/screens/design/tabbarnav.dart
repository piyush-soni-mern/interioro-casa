import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/category.dart';
import 'package:interioro_casa/screens/design/product.dart';
import 'package:interioro_casa/screens/design/productpage.dart';


class Productsview extends StatefulWidget {
  
  final List<Category> passedcats ;
  final int selectedtabindex ;
  
  const Productsview({ Key? key, required this.passedcats, required this.selectedtabindex }) : super(key: key);


  @override
  State<Productsview> createState() => _ProductsviewState(passedcats);
}

class _ProductsviewState extends State<Productsview> with SingleTickerProviderStateMixin {
  
  List<Category> passedcats;

  _ProductsviewState(this.passedcats);
  
  late TabController _tabController ;
  
  List<Tab> productTabs = [];
  
  int index = 0 ; 

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: widget.selectedtabindex ,
      length: passedcats.length, 
      vsync: this, 
      animationDuration: const Duration(milliseconds: 980),
    );

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    for (var element in passedcats) {
      productTabs.add(Tab(text: element.categorytype,));
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 251, 231, 1),
      appBar: AppBar(
        title: const Text('InteriorCasa'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            height: 25.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TabBar(
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                fontFamily: 'Georgia',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: Colors.greenAccent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.blueAccent, 
              ),
              isScrollable: true,
              controller: _tabController,
              
              tabs: productTabs
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductPage(
                  title: productTabs[index++].text.toString() + ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),

                ProductPage(
                  title: productTabs[index++].text.toString()+ ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),

                ProductPage(
                  title: productTabs[index++].text.toString()+ ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),

                ProductPage(
                  title: productTabs[index++].text.toString()+ ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),

                ProductPage(
                  title: productTabs[index++].text.toString()+ ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),
                
                ProductPage(
                  title: productTabs[index++].text.toString() + ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),
            
                ProductPage(
                  title: productTabs[index++].text.toString() + ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),

                ProductPage(
                  title: productTabs[index++].text.toString() + ' Interior Designs', 
                  titledesc: 'Check out products at InteriorCasa\'s',
                  productcardslist: [
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                    Product('scene.jpg', 'Description'),
                  ]
                ),
            ]),
          )
        ],
      ),
      
    );
  }
}