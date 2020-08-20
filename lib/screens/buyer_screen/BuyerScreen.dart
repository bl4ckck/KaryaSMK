import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:karyasmk/screens/buyer_screen/PurchaseHistory.dart';
import 'package:karyasmk/widgets/ProfileInfo.dart';
import 'package:neumorphic/neumorphic.dart';

class BuyerScreen extends StatefulWidget {
  const BuyerScreen({Key key}) : super(key: key);

  @override
  _BuyerSellerScreenState createState() => _BuyerSellerScreenState();
}

class _BuyerSellerScreenState extends State<BuyerScreen> {
  AuthBloc _authBloc;
  TransactionBloc _transactionBloc;
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

    _transactionBloc = BlocProvider.of<TransactionBloc>(context);
    _transactionBloc.add(FetchTransactionEvent(uid));
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
  }

  void refresh() async {
    _transactionBloc = BlocProvider.of<TransactionBloc>(context);
    _transactionBloc.add(FetchTransactionEvent(uid));
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Text(
                  'Purchase History',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              PurchaseHistory()
            ],
          ),
        ),
      ),
    );
  }
}
