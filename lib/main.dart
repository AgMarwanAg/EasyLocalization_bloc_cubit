import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_app/cubit/locale_cubit.dart';
import 'home_page.dart';

String lang = 'en';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(BlocProvider(create: (context) {
    return LocaleCubit();
  }, child: BlocBuilder<LocaleCubit, ChangeLocaleState>(builder: (context, state) {
    return EasyLocalization(
      key: GlobalKey(),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: "assets/translations",
      fallbackLocale: Locale(state.locale),
      startLocale: Locale(state.locale),
      child: const MyApp(),
    );
  })));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, ChangeLocaleState>(
      builder: (context, state) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: Locale(state.locale),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
