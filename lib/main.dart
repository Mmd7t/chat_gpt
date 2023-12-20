import 'package:chat_gpt/config/routes/app_routes.dart';
import 'package:chat_gpt/config/theme.dart';
import 'package:chat_gpt/core/database/hive_model/chat_item.dart';
import 'package:chat_gpt/core/database/hive_model/message_item.dart';
import 'package:chat_gpt/core/database/hive_model/message_role.dart';
import 'package:chat_gpt/core/database/shared_prefs.dart';
import 'package:chat_gpt/features/auth/data/repositories/auth_repo.dart';
import 'package:chat_gpt/features/auth/domain/repositories/base_repo.dart';
import 'package:chat_gpt/features/auth/presentation/auth_provider.dart';
import 'package:chat_gpt/features/auth/presentation/cubit/login_cubit.dart/login_cubit.dart';
import 'package:chat_gpt/features/auth/presentation/cubit/signup_cubit.dart/signup_cubit.dart';
import 'package:chat_gpt/features/chat/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:chat_gpt/features/intro/presentation/pages/splash_screen.dart';
import 'package:chat_gpt/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './core/di/injection.dart' as di;
import './core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SharedPrefsHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ChatItemAdapter());
  Hive.registerAdapter(MessageItemAdapter());
  Hive.registerAdapter(MessageRoleAdapter());
  await Hive.openBox('chats');
  await Hive.openBox('messages');
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthStateProvider _authProvider = AuthStateProvider();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthBaseRepo>(
          create: (context) => sl<AuthRepositoryImpl>(),
        ),
        BlocProvider<LoginCubit>(create: (context) => sl<LoginCubit>()),
        BlocProvider<SignupCubit>(create: (context) => sl<SignupCubit>()),
        BlocProvider<SettingsCubit>(create: (context) => sl<SettingsCubit>()),
      ],
      child: StreamBuilder(
        stream: _authProvider.user,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Chat GPT',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: SplashPage(user: snapshot.data),
            routes: appRoutes,
          );
        },
      ),
    );
  }
}
