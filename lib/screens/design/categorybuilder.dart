import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/tabbarnav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'category.dart';

class CategoryBuilder extends StatelessWidget {
  CategoryBuilder({Key? key}) : super(key: key);

  Future<List<Category>> getAllCategories() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _categories.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => Category(doc['cat_image'],doc['name'])).toList();
    return allData;
  }

  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');

  Widget cardBuilder(BuildContext context, int index,Future<List<Category>> categories) {
    List<Category> categories_list = [];
    Category category = Category('', '');
    categories.then((value) {category = value[index];});
    
    if(categories_list.isNotEmpty){
      category = categories_list[index];
    }

    return category.imgsrc != ''  ? GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Productsview(
                      passedcats: categories_list,
                      selectedtabindex: index,
                    )));
      },
      child: Card(
          color: const Color.fromRGBO(160, 188, 194, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  child: Image.network(category.imgsrc)),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                category.categorytype,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              )
            ],
          )),
    ) : const Text("No data");
  }

  @override
  Widget build(BuildContext context) {
    final Future<List<Category>> categories = getAllCategories();

    return StreamBuilder(
        stream: _categories.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: streamSnapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) => cardBuilder(context, index,categories));
          } else {
            return const Text("Something went wrong!!");
          }
        });
  }

  
}
