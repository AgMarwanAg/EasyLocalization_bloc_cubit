import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:locale_app/main.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState( lang));
  Future<void> changeLanguage(String lang) async {
    emit(ChangeLocaleState(  lang));
  }
}
