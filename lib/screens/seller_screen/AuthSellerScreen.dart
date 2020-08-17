import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/screens/seller_screen/AddProduct.dart';
import 'package:karyasmk/screens/seller_screen/index_add_product.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/ProfileInfo.dart';
import 'package:neumorphic/neumorphic.dart';

class AuthSellerScreen extends StatefulWidget {
  const AuthSellerScreen({Key key}) : super(key: key);

  @override
  _AuthSellerScreenState createState() => _AuthSellerScreenState();
}

class _AuthSellerScreenState extends State<AuthSellerScreen> {
  AuthBloc _authBloc;
  String email = '';
  String nama = '';
  String type = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    loadBox();
  }

  void loadBox() async {
    final box = await Hive.openBox('sessionUser');

    setState(() {
      email = box.getAt(0).email ?? '';
      nama = box.getAt(0).nama ?? '';
      type = box.getAt(0).type ?? '';
      phone = box.getAt(0).phone ?? '';
    });
  }

  void signOut() async {
    final box = await Hive.openBox('sessionUser');
    setState(() {
      email = '';
      nama = '';
      type = '';
      phone = '';
    });

    box.deleteAt(0);

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(FetchSession('general'));

    print('Rolenya: general');
  }

  Widget signOutButton(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.red,
        child: MaterialButton(
          minWidth: MediaQuery.of(ctx).size.width / 4,
          onPressed: () {
            signOut();
          },
          child: Text("Sign Out",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ProfileInfo(email: email, nama: nama, phone: phone, type: type),
                signOutButton(context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Products',
                    style: TextStyle(fontSize: 20),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new IndexAddProduct(),
                        ),
                      );
                    },
                    elevation: 2,
                    tooltip: 'Add Item',
                    foregroundColor: HexColor('#ef8d31'),
                    child: Icon(
                      Icons.add,
                    ),
                    backgroundColor: NeuTheme.of(context).backgroundColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
