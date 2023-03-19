import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:interioro_casa/data/room_entity.dart';
import 'package:interioro_casa/data/room_post_entity.dart';

class Magazine extends StatefulWidget {
  const Magazine({Key? key}) : super(key: key);

  @override
  State<Magazine> createState() => _MagazineState();
}

class _MagazineState extends State<Magazine> {

  final String apiToken = "64ce458ca55060f803110fd18dbd9944bc9e523e";

  List themes = ["Modern", "Minimalis", "Professional", "Tropical", "Vintage"];
  List rooms = [
    "Living Room",
    "Dining Room",
    "Office",
    "Bedroom",
    "Bathroom",
    "Gaming Room",
    "Kitchen"
  ];
  String theme = "Modern";
  String room = "Living Room";
  String roomImage = "";
  String roomName = "";

  String roomImageUrl = "";
  String generatedImageUrl = "";
  RoomPostEntity? roomPostEntity;
  RoomEntity? roomEntity;

  void setImage(String path) {
    setState(() {
      roomImage = path;
    });
  }

  pickImageFromGallery(ImageSource source) async {
    ImagePicker i = ImagePicker();
    XFile? file = await i.pickImage(source: source);

    if (file != null) {
      setState(() {
        roomImage = file.path;
        roomName = file.name;
      });
    } else {
      setState(() {
        roomImage = '';
      });
    }
  }

  generateImage() async {
    try {
      showDialog(
          context: context,
          // barrierDismissible: false,
          useRootNavigator: true,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(
                    semanticsValue:
                        "This may take 2-3 minutes to generate your room"),
              )));
      roomImageUrl = await uploadImageToFirebase();
      var response =
          await http.post(Uri.parse("https://api.replicate.com/v1/predictions"),
              headers: {
                // "Content-Type": "application/json",
                "Authorization":
                    "Token $apiToken"
              },
              body: json.encode({
                "version":
                    "854e8727697a057c525cdb45ab037f64ecca770a1769cc52287c2e56472a247b",
                "input": {
                  "image": roomImageUrl,
                  "prompt": room == "Gaming Room"
                      ? "a room for gaming with gaming computers, gaming consoles, and gaming chairs"
                      : "a $theme $room",
                  "a_prompt":
                      "best quality, extremely detailed, photo from Pinterest, interior, cinematic photo, ultra-detailed, ultra-realistic, award-winning",
                  "n_prompt":
                      "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality"
                }
              }));
      roomPostEntity = roomPostEntityFromJson(response.body);
      if (roomPostEntity!.error == null) {          
        final response = await http.post(Uri.parse('https://room-gpt-api.vercel.app/generateImage'),
          headers: {
            "content-type": "application/json"
          },
          body: jsonEncode({
            // "url": roomPostEntity!.urls.urlsGet,
            "url":"https://api.replicate.com/v1/predictions/j3wymd7dyncyxebxc22okyhqiy"
          })
        );
        roomEntity = roomEntityFromJson(response.body);
        if (roomEntity!.status == "succeeded") {
          final List<dynamic> outputs = roomEntity!.output;
          setState(() {
            generatedImageUrl = outputs[1].toString();
          });
        }
      }
    } catch (e) {
      // print(e);
      log(e.toString());
    }

    Navigator.pop(context);
  }

  uploadImageToFirebase() async {
    try {
      // firebase_storage.UploadTask uploadTask;
      Reference ref =
          FirebaseStorage.instance.ref().child('uploads').child('/' + roomName);

      await ref.putFile(File(roomImage)).whenComplete(() => null);

      String url = await ref.getDownloadURL();
      //  print(url);
      return url;
    } catch (e) {
      // print(e);
    }
  }

  Widget showImage() {
    return roomImage == ""
        ? const Text("")
        : Image.file(
            File(roomImage),
            width: 300,
            height: 300,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Choose your room theme",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                DropdownButton(
                    hint: const Text("Choose theme"),
                    isExpanded: true,
                    items: themes
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    value: theme,
                    onChanged: (value) {
                      setState(() {
                        theme = value.toString();
                      });
                    }),
                const Text("Choose your room type",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                DropdownButton(
                    hint: const Text("Choose room type"),
                    isExpanded: true,
                    items: rooms
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    value: room,
                    onChanged: (value) {
                      setState(() {
                        room = value.toString();
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await pickImageFromGallery(ImageSource.gallery);
                    },
                    child: const Text('Choose image from gallery')),
                showImage(),
                roomImage != ""
                    ? ElevatedButton.icon(
                        onPressed: () {
                          generateImage();
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text("Generate Image"))
                    : const SizedBox(),
                generatedImageUrl != ""
                    ? Image.network(
                        generatedImageUrl,
                        width: 300,
                        height: 300,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
