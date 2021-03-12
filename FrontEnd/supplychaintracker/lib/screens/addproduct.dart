// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'dart:io';
// import 'package:provider/provider.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

String imgURL;

class Addproduct extends StatelessWidget {
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.lightGreen,
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

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  // final AuthService _auth = AuthService();
  String pname = '';
  String pdesc = '';
  String quan = '';
  String qual = '';
  String role = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter a product name' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.shopping_basket),
              hintText: 'Enter product name',
              labelText: 'Product Name',
            ),
            onChanged: (val) {
              setState(() => pname = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter description' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.description),
              hintText: 'Enter product description',
              labelText: 'Product Description',
            ),
            onChanged: (val) {
              setState(() => pdesc = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Quantity must' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.line_weight),
              hintText: 'Enter product quantity in kilograms',
              labelText: 'Quantity',
            ),
            onChanged: (val) {
              setState(() => quan = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter quality grade' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.high_quality),
              hintText: 'Enter Quality check details',
              labelText: 'Quality',
            ),
            onChanged: (val) {
              setState(() => qual = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter your role' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.perm_identity),
              hintText: 'Enter your role eg:"Farmer"',
              labelText: 'Role',
            ),
            onChanged: (val) {
              setState(() => role = val);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: RaisedButton(
                child: Text(imgURL == '' ? 'Add product' : 'Image added'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addimage()),
                  );
                }),
          ),
          new Container(
            child: new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('Add Product'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DatabaseService(uid: uid)
                          .addProduct(pname, pdesc, quan, qual, role, imgURL);
                      imgURL = '';
                      Navigator.pop(context);
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}

class Addimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
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
      _file = File(_imageFile.path);
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
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_file),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),
            Uploader(file: _file),
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
  // final FirebaseStorage _storage = FirebaseStorage.instance;
  // final Reference _storageRef = FirebaseStorage.instance.ref();
  UploadTask _uploadTask;
  Future<void> _startUpload() async {
    final String filepath = 'productimages/' + DateTime.now().toString();
    Reference _storageRef = FirebaseStorage.instance.ref().child(filepath);
    TaskSnapshot taskSnapshot = await _storageRef.putFile(widget.file);
    // TaskSnapshot taskSnapshot = await _uploadTask.onComplete;
    imgURL = await taskSnapshot.ref.getDownloadURL();
    imgURL = imgURL.toString();
    print(imgURL);
  }

  // Future uploadImageToFirebase(BuildContext context) async {
  //   String filepath = 'productimages/' + DateTime.now().toString();
  //   Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(filepath);
  //   UploadTask uploadTask = firebaseStorageRef.putFile(widget.file);
  //   TaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //   taskSnapshot.ref.getDownloadURL().then(
  //         (value) => print("Done: $value"),
  //       );
  // }

//   Future<void> _uploadFile() async {
//    try {
//       // final String fileName = DateFormat('yy-MM-ddTH:mm:s').format(DateTime.now()).toString() + filePath.split('/').last;
//       final Reference storageRef = FirebaseStorage.instance.ref().child('productimages/');
//       final UploadTask task = storageRef.putFile(widget.file);
//       return await (await task.onComplete).ref.getDownloadURL();
//    } catch (error) {
//       print(error.toString());
//       throw error.toString();
//    }
// }
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
