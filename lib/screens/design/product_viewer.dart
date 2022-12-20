import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Productviewer extends StatefulWidget {
  const Productviewer({Key? key, required this.documentSnapshot})
      : super(key: key);
  final DocumentSnapshot documentSnapshot;

  @override
  State<Productviewer> createState() => _ProductviewerState();
}

class _ProductviewerState extends State<Productviewer> {
  int quantity = 1;
  int selectedimage = 0;
  late Color selectedcolor;

  Widget smallPreviewBuilder(BuildContext context, int index, List<String> images) {
    final String currimgsrc = images[index];
    if (selectedimage == index) {
      selectedcolor = Colors.amberAccent;
    } else {
      selectedcolor = Colors.white;
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedimage = index;
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
              color: selectedcolor,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            image: DecorationImage(
              image: NetworkImage(currimgsrc),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _incrementqty() {
    setState(() {
      quantity++;
    });
  }

  void _decrementqty() {
    setState(() {
      quantity--;
      if (quantity < 1) {
        quantity = 1;
      }
    });
  }

  _launchURLBrowser(String arUrl) async {
    Uri url = Uri.parse(arUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot doc = widget.documentSnapshot;
    List<String> images = List.from(doc['images']);
    String title = doc['title'].toString();
    String description = doc['description'].toString();
    String price = doc['price'].toString();
    bool haveAR = doc['haveAR'];
    String arUrl = doc['ar_url'].toString();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: haveAR ? FloatingActionButton(
          child: const Icon(Icons.open_in_browser_outlined),
          onPressed: () => _launchURLBrowser(arUrl)
        ) : null,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(images[selectedimage]),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: images.length,
                      itemBuilder: (context, index) =>
                          smallPreviewBuilder(context, index, images)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 8.0, 0.0, 0.0),
                  child: ElevatedButton(
                      onPressed: () {Navigator.pop(context);},
                      style: ElevatedButton.styleFrom(
                        elevation: 3.0,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_back)),
                )
              ]),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 0.0, 0.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Price: ${price}Rs',
                            style: const TextStyle(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Row(
                            children: [
                              Expanded(
                                  child: IconButton(
                                onPressed: () {
                                  _decrementqty();
                                },
                                icon: const Icon(Icons.remove),
                              )),
                              Text(
                                '$quantity',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Expanded(
                                  child: IconButton(
                                onPressed: () {
                                  _incrementqty();
                                },
                                icon: const Icon(Icons.add),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(100.0, 30.0, 8.0, 0.0),
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
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
