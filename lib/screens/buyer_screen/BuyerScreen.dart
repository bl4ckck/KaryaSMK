import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';

class BuyerScreen extends StatefulWidget {
  const BuyerScreen({Key key}) : super(key: key);

  @override
  _BuyerSellerScreenState createState() => _BuyerSellerScreenState();
}

class _BuyerSellerScreenState extends State<BuyerScreen> {
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    loadBox();
  }

  void loadBox() async {
    final box = await Hive.openBox('sessionUser');
    print(box.getAt(0).email);
  }

  void singOutStudent() async {
    final box = await Hive.openBox('sessionUser');

    box.deleteAt(0);

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(FetchSession('general'));

    print('Rolenya: general');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Ini Buyer Screen',
          style: TextStyle(fontSize: 50),
        ),
        InkWell(
            onTap: () {
              singOutStudent();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
