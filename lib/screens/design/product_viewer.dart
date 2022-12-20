import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Productviewer extends StatefulWidget {
  const Productviewer({ Key? key , required this.documentSnapshot}) : super(key: key);
  final DocumentSnapshot documentSnapshot;

  @override
  State<Productviewer> createState() => _ProductviewerState();
}

class _ProductviewerState extends State<Productviewer> {

  int quantity = 1;
  int selectedimage = 0 ;
  late Color selectedcolor ;
  List<String> images = [
    'scene.jpg',
    'Garden.jpg',
    'Geralt.jpg',
    'donut.png',
  ];

  Widget smallPreviewBuilder(BuildContext context, int index){
    final String currimgsrc = images[index] ;
    if(selectedimage == index){
      selectedcolor = Colors.amberAccent ;
    }
    else{
      selectedcolor = Colors.white ;
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectedimage = index ;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: selectedcolor ,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            image: DecorationImage(
              image: AssetImage(currimgsrc),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _incrementqty(){
    setState(() {
      quantity++;
    });
  }

  void _decrementqty(){
    setState(() {
      quantity--;
      if(quantity<0){
        quantity = 0 ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [ 
                Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(images[selectedimage]),
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                ),
              ),

              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: images.length,
                itemBuilder: (context,index) => smallPreviewBuilder(context, index)
              ),
            ),

              Padding(
                padding: const EdgeInsets.fromLTRB(2.0,8.0,0.0,0.0),
                child: ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: const CircleBorder(),
                ),
                child: const Icon(Icons.arrow_back)),
              )
            ]
            ),
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0,10.0,0.0,0.0),
                    child: Text(
                      'Wireless Controller for PS4',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8.0,10.0,0.0,0.0),
                      child: Text(
                        'Price: 14Rs',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(right: 5.0, top: 5.0),
                      height: 40.0,
                      width: 90.0,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      child: Row(
                        children: [
                          Expanded(child: IconButton(
                            onPressed:(){
                              _decrementqty();
                            }, 
                            icon: const Icon(Icons.remove),
                          )
                          ),
                          
                          Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                          ),

                          Expanded(child: IconButton(
                            onPressed:(){
                              _incrementqty();
                            }, 
                            icon: const Icon(Icons.add),
                          )
                          ),

                        ],
                      ),
                    )                    
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0,10.0,8.0,0.0),
                    child: Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0,10.0,8.0,0.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit similique repudiandae rerum vel vero omnis itaque veniam necessitatibus natus, culpa nemo, eveniet eius',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(100.0,30.0,8.0,0.0),
                    height: 60.0,
                    width: 150.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Center(
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}