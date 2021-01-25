import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/bloc/weather_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Home(),
      ),
    );
  }
}
