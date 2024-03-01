import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_app/cubit/locale_cubit.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return EasyLocalization(
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            path: "assets/lang",
            fallbackLocale: state.locale,
            startLocale: state.locale,
            saveLocale: false,
            child: MaterialApp(
              locale: state.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
