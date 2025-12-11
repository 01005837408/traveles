import 'package:flutter/material.dart';
import 'package:traveles/core/routes/app_router.dart';
import 'package:traveles/core/routes/routes_constant.dart';
import 'package:device_preview/device_preview.dart';


void main() async{
  //  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute:ConstantRoutes.login ,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

