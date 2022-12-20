import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/tabbarnav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryBuilder extends StatelessWidget {
  CategoryBuilder({Key? key}) : super(key: key);

  final CollectionReference _categories =
      FirebaseFirestore.instance.collection('categories');

  Widget cardBuilder(BuildContext context, int index,String url,String name) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Productsview(
                      selectedtabindex: index,
                      category: name,
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
                  child: Image.network(url)),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  return cardBuilder(context, index,documentSnapshot['cat_image'].toString(),documentSnapshot['name'].toString());
                }
                );
          } else {
            return const Text("Something went wrong!!");
          }
        });
  }

}
