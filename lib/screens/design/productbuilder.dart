import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/product_viewer.dart';
import 'product.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({ Key? key , required this.productcards }) : super(key: key);

  final List<Product> productcards ;

  Widget productCardBuilder(BuildContext context, int index){
    final Product product = productcards[index] ;
    
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Productviewer(),));
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
                child: Image.asset(
                  'assets/'+product.imgsrc
                ),
              ),
    
              const SizedBox(width: 10.0,),
              Text(
                product.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
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
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productcards.length,
      itemBuilder: (context, index) => productCardBuilder(context,index) );
  }
}