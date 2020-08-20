import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:karyasmk/helper/currencyFormat.dart';
import 'package:karyasmk/models/models.dart';
import 'package:karyasmk/screens/detail_screen/detail_screen.dart';
import 'package:neumorphic/neumorphic.dart';

class DeleteScreen extends StatefulWidget {
  final List<GetDataDetail> data;

  const DeleteScreen({Key key, @required this.data}) : super(key: key);

  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  ProductDetailBloc _deleteProductlBloc;

  Widget customAppBar(BuildContext ctx) {
    return AppBar(
      backgroundColor: NeuTheme.of(ctx).backgroundColor,
      elevation: 0,
      leading: IconButton(
        iconSize: 27,
        color: Colors.black,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(ctx, true);
        },
      ),
    );
  }

  Widget custBottomBar() {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 45,
          )
        ],
      ),
    );
  }

  Widget floatingButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: FloatingActionButton.extended(
        elevation: 4.0,
        backgroundColor: Colors.red,
        label: Text('Delete Product'),
        onPressed: () {
          submitDelete();
        },
      ),
    );
  }

  void submitDelete() async {
    _deleteProductlBloc = BlocProvider.of<ProductDetailBloc>(context);
    _deleteProductlBloc.add(DeleteProductDetail(widget.data[0].idProduct));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (widget.data.isNotEmpty) {
      return Scaffold(
          backgroundColor: NeuTheme.of(context).backgroundColor,
          appBar: customAppBar(context),
          floatingActionButton: floatingButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SingleChildScrollView(
              child: Container(
                  margin:
                      EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 70),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        DisplayImage(url: widget.data[0].thumb, size: size),
                        SizedBox(
                          height: 22,
                        ),
                        Text('Product Name:',
                            style: style.copyWith(fontSize: 17)),
                        Text(
                          widget.data[0].title,
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text('Stock:', style: style.copyWith(fontSize: 17)),
                        Text(
                          '${widget.data[0].quantity} item(s)',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text('Price:', style: style.copyWith(fontSize: 17)),
                        Text(
                          currencyFormat(widget.data[0].price),
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text('Description:',
                            style: style.copyWith(fontSize: 17)),
                        Text(
                          widget.data[0].description,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ))));
    }
    return Scaffold(
        backgroundColor: NeuTheme.of(context).backgroundColor,
        appBar: customAppBar(context),
        body: Center(
          child: Text('Data Not Found :('),
        ));
  }
}
