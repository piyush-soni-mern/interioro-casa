import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interioro_casa/screens/design/product_viewer.dart';

class ArProductBuidler extends StatefulWidget {
  const ArProductBuidler({Key? key}) : super(key: key);

  @override
  State<ArProductBuidler> createState() => _ArProductBuidlerState();
}

class _ArProductBuidlerState extends State<ArProductBuidler> {

    Widget productCardBuilder(BuildContext context,DocumentSnapshot documentSnapshot){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Productviewer(documentSnapshot: documentSnapshot,),));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
        height: 100.0,
        child: Card(
          color: const Color.fromARGB(255, 197, 244, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  documentSnapshot['first_image'],
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.fill,
                ),
              ),
    
              const SizedBox(width: 10.0,),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      documentSnapshot['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      documentSnapshot['description'],
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final _products =
      FirebaseFirestore.instance.collection('products').where('haveAR',isEqualTo: true);
    return StreamBuilder(
      stream: _products.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if(streamSnapshot.hasData){
          return ListView.builder(
          padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: streamSnapshot.data!.docs.length,
          itemBuilder: (context, index) {
             final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
             return productCardBuilder(context,documentSnapshot); 
          });
        }else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}