import 'package:chat_gpt/config/extensions.dart';
import 'package:chat_gpt/features/chat/presentation/cubit/settings_cubit/settings_cubit.dart';
import 'package:chat_gpt/features/chat/presentation/pages/updates_faq.dart';
import 'package:chat_gpt/features/chat/presentation/widgets/home_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeBottomSector extends StatelessWidget {
  final Box box;
  const HomeBottomSector({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeListTile(
          onTap: () {
            box.clear();
          },
          icon: 'delete',
          title: 'Clear conversations',
        ),
        HomeListTile(
          onTap: () {},
          icon: 'person',
          title: 'Upgrade to Plus',
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFFBF3AD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: 'NEW'.bodySmall(
              context,
              color: const Color(0xFF887B06),
            ),
          ),
        ),
        HomeListTile(
          onTap: () {},
          icon: 'sun',
          title: 'Light mode',
        ),
        HomeListTile(
          onTap: () => Navigator.of(context).pushNamed(UpdatesFaqPage.route),
          icon: 'faq',
          title: 'Updates & FAQ',
        ),
        HomeListTile(
          onTap: () {
            context.read<SettingsCubit>().signout(context);
          },
          icon: 'logout',
          title: 'Logout',
          color: context.color.error,
        ),
      ],
    );
  }
}
