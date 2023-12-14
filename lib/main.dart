import 'package:chargemod_asif/screens/login_screen/bloc/login_bloc.dart';
import 'package:chargemod_asif/screens/splash/splash_screen.dart';
import 'package:chargemod_asif/utilis/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: KAppTheme.lightTheme,
      darkTheme: KAppTheme.darkTheme,
      home: BlocProvider(
        create: (context)=>LoginBloc(),
        child: const SplashScreen(),
      ),
    );
  }
}
