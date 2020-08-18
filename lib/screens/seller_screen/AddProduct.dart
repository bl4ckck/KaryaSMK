import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:karyasmk/bloc/bloc.dart';
import 'package:karyasmk/bloc/seller_product_bloc/seller_product_bloc.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key key, @required this.uid}) : super(key: key);
  final String uid;

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  File _image;
  ProductListBloc _productBloc;
  SellerProductBloc _sellerProductBloc;

  String titleText, descriptionText, categoryText;
  String quantityText, priceText;
  bool isEmpty = true;

  List<String> listCategory = [
    'Software',
    'Electronic',
    'Handycraft',
    'Multimedia',
    'Food',
    'Others'
  ];

  @override
  void initState() {
    super.initState();
    fetchNewItem();
  }

  void fetchNewItem() async {
    _sellerProductBloc = BlocProvider.of<SellerProductBloc>(context);

    _sellerProductBloc.add(FetchSellerProductEvent(widget.uid));
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      if (pickedFile.path != null) isEmpty = false;
    });
  }

  void postProduct() async {
    _productBloc = BlocProvider.of<ProductListBloc>(context);
    _productBloc.add(PostProduct(
        category: categoryText,
        description: descriptionText,
        file: _image ?? null,
        quantity: quantityText,
        price: priceText,
        title: titleText,
        uid: widget.uid));
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  Widget titleField() {
    return TextFormField(
      onChanged: (value) => titleText = value,
      style: style,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter product title';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Product Title',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "Enter Product Title...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget quantityField() {
    return TextFormField(
      onChanged: (value) => quantityText = value,
      style: style,
      keyboardType: TextInputType.number,
      inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter product quantity';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Quantity',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "Enter Product Quantity...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget priceField() {
    return TextFormField(
      onChanged: (value) => priceText = value,
      style: style,
      keyboardType: TextInputType.number,
      inputFormatters: [
        new WhitelistingTextInputFormatter(RegExp("[0-9]")),
      ],
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter product price';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Price',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "IDR...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget descriptionField() {
    return TextFormField(
      onChanged: (value) => descriptionText = value,
      style: style,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter description';
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Description',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "Enter Description...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget categoryField() {
    return DropdownButton(
      isExpanded: true,
      hint: Text("Select Product Category"),
      value: categoryText,
      items: listCategory.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          categoryText = value;
        });
      },
    );
  }

  Widget submitButton() {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.orangeAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (_formKey.currentState.validate() &&
              isEmpty == false &&
              categoryText != null) {
            postProduct();
          } else {
            Fluttertoast.showToast(
                msg: "Please fill in all the required forms!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                webShowClose: true,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: Text("Submit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(36),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              titleField(),
              SizedBox(height: 25.0),
              priceField(),
              SizedBox(height: 25.0),
              quantityField(),
              SizedBox(height: 25.0),
              descriptionField(),
              SizedBox(height: 25.0),
              categoryField(),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: _image == null
                      ? Text('Select product image')
                      : Image.file(_image),
                ),
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(height: 25.0),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }
}
