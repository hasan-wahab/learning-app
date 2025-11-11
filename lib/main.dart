import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodi/local_storage_service/local_data/local_data.dart';
import 'app_routes/onGenerateRoute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalDataStorage.init();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDyzrzayRJDSr1rgMcg3DJWaqdw7T0iKX8",
      appId: "1:301740951111:android:9bf33c80c4ed568720d362",
      messagingSenderId: "301740951111",
      projectId: "learningapp-4c35b",
    ),
  );

  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),

      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ya syntex serep ek hi list or same type ka list hum es tarah direct pass kar saktay hay
      //providers: AppRouting.blocProviderList(),
      providers: AppRouting.blocProviderList(),

      // yaha per spread oprater use hoa hay ... kisi b list m,ay mutiple list add karnay ho to spred oprtaer use kya jata hay
      //providers: [...AppRouting.blocProviderList(),...AppRouting.blocProvider()],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // initialRoute:AppRoutes.onBoardingPersonClass,
        onGenerateRoute: (RouteSettings settings) =>
            AppRouting.onGenerateRoute(settings, context),
      ),
      //   },
      // ),
    );
  }
}
