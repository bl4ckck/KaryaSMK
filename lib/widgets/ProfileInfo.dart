import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo(
      {Key key,
      @required this.nama,
      @required this.type,
      @required this.phone,
      @required this.email})
      : super(key: key);
  final String nama, type, phone, email;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = ((size.height - kToolbarHeight - 24) / 2) + 50;
    final double itemWidth = size.width;

    return DefaultTextStyle(
      style: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
      child: Container(
          margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 50),
          padding: EdgeInsets.only(top: 10, bottom: 50, left: 20, right: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: NeuTheme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/avatar.png',
                width: 80,
              ),
              Text(
                nama,
                maxLines: 2,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  email ?? '',
                  maxLines: 1,
                ),
              ),
              Text(phone ?? '', maxLines: 1),
            ],
          )),
    );
  }
}
