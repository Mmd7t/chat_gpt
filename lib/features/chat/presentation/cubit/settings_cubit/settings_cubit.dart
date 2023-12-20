import 'package:chat_gpt/features/auth/domain/usecases/signout_usecase.dart';
import 'package:chat_gpt/features/auth/presentation/pages/auth_page.dart';
import 'package:chat_gpt/features/chat/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SignOutUseCase _signOutUseCase;
  SettingsCubit(SignOutUseCase signOutUseCase)
      : _signOutUseCase = signOutUseCase,
        super(const SettingsInitial());
  final List<ChatModel> chats = [];

  Future<void> signout(BuildContext context) async {
    emit(const SettingsLoading());
    try {
      await _signOutUseCase().then((value) => Navigator.of(context)
          .pushNamedAndRemoveUntil(AuthPage.route, (route) => false));

      emit(const SettingsSuccess());
    } catch (err) {
      emit(const SettingsFailure());
    }
  }
}
