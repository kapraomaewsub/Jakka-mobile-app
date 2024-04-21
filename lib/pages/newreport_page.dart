import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';
import 'package:jakka_app/resources.dart/add_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Newreportpage extends StatefulWidget {
  const Newreportpage({super.key});

  @override
  State<Newreportpage> createState() => _NewreportpageState();
}

class _NewreportpageState extends State<Newreportpage> {
  final TextEditingController _reportTextController = TextEditingController();

  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch uesr details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(currentUser!.uid)
        .get();
  }

  File? image;

  // pick image from our gallery
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);

      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  void saveReport({jakkaNo}) async {
    String resp = await StoreData().saveData(
      date: Timestamp.now(),
      jakkaNo: jakkaNo,
      status: "Accepted",
      problem: _reportTextController.text,
      user: currentUser!.uid,
      file: image!.readAsBytesSync(),
    );
  }

  // // save report's data to firestore
  // saveReport({dateTime, jakkaNo}) async {
  //   final docUser = FirebaseFirestore.instance.collection('Report').doc();

  //   final json = {
  //     'Date': FieldValue.serverTimestamp(),
  //     'Jakka_No': jakkaNo,
  //     'Pic': "",
  //     'Problem': _reportTextController.text,
  //     'Status': "Accepted",
  //     'User': currentUser!.uid,
  //   };

  //   await docUser.set(json);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: displayAppBar('New Report'),
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          // data receive
          else if (snapshot.hasData) {
            // extract data
            Map<String, dynamic>? user = snapshot.data!.data();

            return ListView(
              children: [
                const SizedBox(height: 15),
                _newreportSection(user: user)
              ],
            );
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }

  Column _newreportSection({
    required Map<String, dynamic>? user,
  }) {
    String formattedDateTime =
        DateFormat('E dd/MM/yyyy HH:mm').format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: showRepoterConponent(
              studentID: user!['Student_ID'],
              name: '${user['Firstname']} ${user['Surname']}',
              dateTime: formattedDateTime,
              jakkaNo: user['Jakka_No']),
        ),
        Center(
          child: SizedBox(
              height: 100,
              width: 320,
              child: Theme(
                data: ThemeData(
                  primaryColor: kSkyBlueColor,
                  primaryColorDark: kSkyBlueColor,
                ),
                child: TextField(
                  controller: _reportTextController,
                  decoration: InputDecoration(
                      hintText: 'Describe your problem here.',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 96, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: kSkyBlueColor,
                          width: 2,
                        ),
                      )),
                ),
              )),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Photo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Center(
          child: SizedBox(
              height: 250,
              width: 320,
              child: Theme(
                data: ThemeData(
                  primaryColor: kSkyBlueColor,
                  primaryColorDark: kSkyBlueColor,
                ),
                child: image != null
                    ? Column(
                        children: [
                          Image.file(
                            image!,
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          myImagePickBtn()
                        ],
                      )
                    : myImagePickBtn(),
              )),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(this.context);
                  saveReport(jakkaNo: user['Jakka_No']);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSkyBlueColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: kSkyBlueColor),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
            kHomePageSmlSizedBox,
          ],
        )),
      ],
    );
  }

  Column myImagePickBtn() {
    return Column(
      children: [
        buildButton(
          title: 'Pick Gallery',
          icon: Icons.image_outlined,
          onClicked: () => pickImage(ImageSource.gallery),
        ),
        const SizedBox(height: 6),
        buildButton(
          title: 'Pick Camera',
          icon: Icons.camera_alt_outlined,
          onClicked: () => pickImage(ImageSource.camera),
        ),
      ],
    );
  }
}
