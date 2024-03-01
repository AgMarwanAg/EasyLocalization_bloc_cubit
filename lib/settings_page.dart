import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale_app/cubit/locale_cubit.dart';

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
                    onPressed: () {
                      context.read<LocaleCubit>().changeLanguage(const Locale('ar'));
                    },
                    child: const Text('ar'));
                // DropdownButton<String>(
                //   value: state.locale.languageCode,
                //   icon: const Icon(Icons.keyboard_arrow_down),
                //   items: ['ar', 'en'].map((String items) {
                //     return DropdownMenuItem<String>(
                //       value: items,
                //       child: Text(items),
                //     );
                //   }).toList(),
                //   onChanged: (String? newValue) {
                //     if (newValue != null) {
                //       context.read<LocaleCubit>().changeLanguage(newValue);
                //     }
                //   },
                // );
              },
            )),
      ),
    );
  }
}
