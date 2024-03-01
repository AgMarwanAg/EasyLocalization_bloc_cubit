import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_app/cubit/locale_cubit.dart';
import 'package:locale_app/main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr()),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () async {
                      context.locale == const Locale('en') ? lang = 'ar' : lang = 'en';
                      context.read<LocaleCubit>().changeLanguage(lang);
                    },
                    child: const Text('ar'));
                
              },
            )),
      ),
    );
  }
}
