import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/bloc/school_bloc/school_bloc.dart';
import 'package:karyasmk/screens/school_screen/SchoolProduct.dart';
import 'package:karyasmk/widgets/ProfileInfo.dart';
import 'package:neumorphic/neumorphic.dart';

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({Key key}) : super(key: key);

  @override
  _SchoolScreenState createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  AuthBloc _authBloc;
  SchoolBloc _schoolBloc;
  String email = '';
  String nama = '';
  String type = '';
  String phone = '';
  String uid = '';

  @override
  void initState() {
    super.initState();
    loadBox();
  }

  void loadBox() async {
    final box = await Hive.openBox('sessionUser');

    setState(() {
      uid = box.getAt(0).uid ?? '';
      email = box.getAt(0).email ?? '';
      nama = box.getAt(0).nama ?? '';
      type = box.getAt(0).type ?? '';
      phone = box.getAt(0).phone ?? '';
    });

    _schoolBloc = BlocProvider.of<SchoolBloc>(context);
    _schoolBloc.add(FetchSchoolProductEvent());
  }

  void signOut() async {
    final box = await Hive.openBox('sessionUser');
    setState(() {
      uid = '';
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

  void refresh() async {
    _schoolBloc = BlocProvider.of<SchoolBloc>(context);
    _schoolBloc.add(FetchSchoolProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) + 50;
    final double itemWidth = size.width / 2;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.refresh,
          size: 30,
        ),
        onPressed: () {
          refresh();
        },
      ),
      backgroundColor: NeuTheme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ProfileInfo(
                      email: email, nama: nama, phone: phone, type: type),
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
                      'School Products',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox()
                  ],
                ),
              ),
              SchoolProduct(
                itemHeight: itemHeight,
                itemWidth: itemWidth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
