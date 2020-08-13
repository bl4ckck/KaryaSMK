import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:karyasmk/helper/hive/session_user.dart';
import 'package:karyasmk/repositories/auth_repository.dart';
import 'package:karyasmk/repositories/product_detail_repo.dart';
import 'package:karyasmk/repositories/product_list_repo.dart';
import 'package:karyasmk/screens/home_screen/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:provider/provider.dart';
import 'bloc/bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.openBox('session');
  Hive.openBox('sessionUser');
  Hive.registerAdapter(SessionUserAdapter());

  runApp(MyApp());
}

Color _color = Color(0xFFf2f2f2);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<ProductListBloc>(
            create: (context) => ProductListBloc(ProductListRepo())),
        BlocProvider<ProductDetailBloc>(
            create: (context) => ProductDetailBloc(ProductDetailRepo())),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(AuthRepository())),
      ],
      child: NeuApp(
        title: 'Karya SMK',
        theme: NeuThemeData(
          platform: TargetPlatform.android,
          primaryColor: Color.lerp(_color, Colors.black, 0.2),
          backgroundColor: Color.lerp(_color, Colors.black, 0.005),
          // appBarTheme: AppBarTheme(
          //   brightness: Brightness.dark,
          //   // color: _color,
          //   textTheme: TextTheme(
          //     headline6: TextStyle(
          //       color: Colors.black,
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          //   iconTheme: IconThemeData(
          //     color: Colors.black,
          //   ),
          // ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
