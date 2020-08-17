import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:neumorphic/neumorphic.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key, final this.isSuccess}) : super(key: key);
  final String isSuccess;

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  final dio = new Dio();

  File _image;
  String pathImage;
  final picker = ImagePicker();

  ProductListBloc _productBloc;

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 133, maxWidth: 133);

    setState(() {
      _image = File(pickedFile.path);
    });
    print(pathImage);
  }

  void postProduct() async {
    _productBloc = BlocProvider.of<ProductListBloc>(context);
    _productBloc.add(PostProduct(
        category: 'Others',
        description: 'nyoba lagi 4',
        file: _image ?? null,
        quantity: 5,
        price: 8183,
        title: 'produk lagi 2',
        uid: 'afwaw'));
  }
  // void postProduct() async {
  //   String fileName = _image.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "uid": '1wludhalcx',
  //     "title": 'Upload Pile',
  //     "quantity": 12,
  //     "price": 17523,
  //     "description": 'ini nyoba upload file',
  //     "category": 'Software',
  //     "file": await MultipartFile.fromFile(_image.path.toString(),
  //         filename: fileName)
  //   });
  //   await dio
  //       .post('http://localhost:5000/api/v1/products', data: formData)
  //       .then((response) => print(response))
  //       .catchError((error) => print(error));
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(36),
        child: Column(
          children: <Widget>[
            Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
            Center(
                child:
                    Text((widget.isSuccess == 'success') ? 'Data Posted' : '')),
            FloatingActionButton(
              heroTag: null,
              onPressed: getImage,
              tooltip: 'Pick Image',
              child: Icon(Icons.add_a_photo),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                postProduct();
              },
              tooltip: 'Upload',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
