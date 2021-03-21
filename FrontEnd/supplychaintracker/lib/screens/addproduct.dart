import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:supplychaintracker/screens/authenticate/animation/FadeAnimation.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';

String imgURL = '';

class Addproduct extends StatelessWidget {
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.greenAccent,
        elevation: 0.2,
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String dropdownValue = 'KG';
  final _formKey = GlobalKey<FormState>();
  String pname = '';
  String pdesc = '';
  String quan = '';
  String qual = '';
  String quant = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Add Product Details",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FadeAnimation(1.2, makeInputpname(label: "Product Name")),
                    FadeAnimation(1.2, makeInputpdesc(label: "Description")),
                    FadeAnimation(1.2, makeInputqual(label: "Quality")),
                    FadeAnimation(1.3, makeInputquan(label: "Quantity")),
                    FadeAnimation(1.4, makeInputquant(label: "Quantity Type")),
                  ],
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Addimage()),
                          );
                        },
                        color: Colors.yellowAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          imgURL != '' ? 'Image added' : 'Add product image',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30.0,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: uid).addProduct(
                                pname, pdesc, quan, quant, qual, imgURL);
                            imgURL = '';
                            Navigator.pop(context);
                          }
                        },
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Add Product",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInputpname({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter product name' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => pname = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputquant({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter quantity type' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => quant = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputqual({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter product quality' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => qual = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputpdesc({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter product description' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => pdesc = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputquan({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter product quantity' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => quan = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class Addimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Upload Image',
            style: TextStyle(fontFamily: "Pompiere", fontSize: 40)),
        backgroundColor: Colors.lightGreen,
        elevation: 0.2,
      ),
      body: ImageCapture(),
    );
  }
}

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  PickedFile _imageFile;
  File _file;
  final _picker = ImagePicker();
  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await _picker.getImage(source: source);
    setState(() {
      _imageFile = selected;
      if (_imageFile != null) {
        _file = File(_imageFile.path);
      }
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    setState(() {
      _file = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100.0,
          child: Row(
            children: <Widget>[
              IconButton(
                color: Colors.lightGreen,
                icon: Icon(
                  Icons.photo_camera,
                  size: 50.0,
                ),
                onPressed: () => _pickImage(ImageSource.camera),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                "Camera",
                style: TextStyle(fontFamily: "Pompiere", fontSize: 25),
              ),
              SizedBox(
                child: Text("   l  ",
                    style: TextStyle(fontFamily: "Pompiere", fontSize: 25)),
              ),
              IconButton(
                color: Colors.lightGreen,
                icon: Icon(
                  Icons.photo_library,
                  size: 50.0,
                ),
                onPressed: () => _pickImage(ImageSource.gallery),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                "Gallery",
                style: TextStyle(fontFamily: "Pompiere", fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_file),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.crop,
                      ),
                      Text(
                        "   Crop Image",
                        style: TextStyle(fontFamily: "Pompiere", fontSize: 40),
                      ),
                    ],
                  ),
                  onPressed: _cropImage,
                  // child: Icon(Icons.crop,),
                  // onPressed: _cropImage,
                ),
                FlatButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.refresh,
                      ),
                      Text(
                        "   Clear",
                        style: TextStyle(fontFamily: "Pompiere", fontSize: 40),
                      ),
                    ],
                  ),
                  onPressed: _clear,
                ),
              ],
            ),
            Uploader(file: _file),
          ] else ...[
            Container(
              height: 300.0,
              child: Center(
                child: Text(
                  "Choose a method to upload image",
                  style: TextStyle(fontFamily: "Pompiere", fontSize: 40),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key, this.file}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  UploadTask _uploadTask;
  Future<void> _startUpload() async {
    final String filepath = 'productimages/' + DateTime.now().toString();
    Reference _storageRef = FirebaseStorage.instance.ref().child(filepath);
    TaskSnapshot taskSnapshot = await _storageRef.putFile(widget.file);
    imgURL = await taskSnapshot.ref.getDownloadURL();
    imgURL = imgURL.toString();
    print(imgURL);
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return Container(
        height: 40.0,
        child: Text(imgURL),
      );
    } else {
      return FlatButton.icon(
          label: Text('Upload Image'),
          icon: Icon(Icons.cloud_upload),
          onPressed: () async {
            await _startUpload();
            Navigator.pop(context);
          });
    }
  }
}
