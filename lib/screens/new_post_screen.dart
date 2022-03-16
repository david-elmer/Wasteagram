import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  LocationData? locationData;
  var locationService = Location();

  File? image;
  final picker = ImagePicker();
  var imageURL = '';

  int numberOfItems = 0;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
    getImage();
  }

  // retrieveLocation function from exploration - share_location_screen.dart
  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    locationData = await locationService.getLocation();

    // getImage();

    setState(() {});
  }

  // getImage based on week 9 exploration 3.4 video and camera_screen.dart
  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);    

    var fileName = DateTime.now().toString() + '.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    imageURL = await storageReference.getDownloadURL();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              displayImage(),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Number of Wasted Items',
                  border: UnderlineInputBorder()
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null) {
                    numberOfItems = int.parse(value);
                  }
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter a number of items';
                  } else {
                    return null;
                  }
                },
              ),
              displayLocation(),
              ElevatedButton(
                onPressed: () {
                  var isValid = formKey.currentState?.validate();
                    if (isValid != null && isValid) {
                      formKey.currentState?.save();
                    }
                  // write to database
                },
                child: const Icon(Icons.cloud_upload_rounded)                
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget displayImage() {
    if (image == null) {
      return const CircularProgressIndicator();
    } else {
      return Image.file(image as File);
    }
  }

  Widget displayLocation() {
    if (locationData == null) {
      return const CircularProgressIndicator();
    } else {
      return Text('Location: (${locationData?.latitude}, ${locationData?.longitude})');
    }
  }

}