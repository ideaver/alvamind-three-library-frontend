import 'package:flutter/material.dart';

import '../../app/extension/string_casing_extension.dart';
import '../../app/route/app_routes.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class ListMenuView extends StatelessWidget {
  const ListMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List Widgets'),
          bottom: TabBar(
            labelColor: AppColors.blackLv1,
            labelPadding: const EdgeInsets.all(18),
            indicatorColor: AppColors.blackLv1,
            labelStyle: AppTextStyle.bold(size: 14),
            tabs: const [
              Text('Atoms'),
              Text('Molecules'),
              Text('Organisms'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            atoms(context),
            molecules(context),
            organisms(context),
          ],
        ),
      ),
    );
  }

  Widget atoms(BuildContext context) {
    var items = AppRoutes.routes.entries.where((e) => e.toString().contains('atom')).toList();

    items.sort((a, b) {
      return a.key.substring(1).split('-').skip(1).join(' ').compareTo(b.key.substring(1).split('-').skip(1).join(' '));
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            items.length,
            (index) {
              return ListTile(
                tileColor: index.isOdd ? AppColors.blackLv7.withOpacity(0.24) : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    items.elementAt(index).key,
                  );
                },
                title: Text(
                  items.elementAt(index).key.substring(1).split('-').skip(1).join(' ').toTitleCase(),
                  style: AppTextStyle.bodyMedium(
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.blackLv1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget molecules(BuildContext context) {
    var items = AppRoutes.routes.entries.where((e) => e.toString().contains('molecule')).toList();

    items.sort((a, b) {
      return a.key.substring(1).split('-').skip(1).join(' ').compareTo(b.key.substring(1).split('-').skip(1).join(' '));
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            items.length,
            (index) {
              return ListTile(
                tileColor: index.isOdd ? AppColors.blackLv7.withOpacity(0.24) : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    items.elementAt(index).key,
                  );
                },
                title: Text(
                  items.elementAt(index).key.substring(1).split('-').skip(1).join(' ').toTitleCase(),
                  style: AppTextStyle.bodyMedium(
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.blackLv1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget organisms(BuildContext context) {
    var items = AppRoutes.routes.entries.where((e) => e.toString().contains('organism')).toList();

    items.sort((a, b) {
      return a.key.substring(1).split('-').skip(1).join(' ').compareTo(b.key.substring(1).split('-').skip(1).join(' '));
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            items.length,
            (index) {
              return ListTile(
                tileColor: index.isOdd ? AppColors.blackLv7.withOpacity(0.24) : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    items.elementAt(index).key,
                  );
                },
                title: Text(
                  items.elementAt(index).key.substring(1).split('-').skip(1).join(' ').toTitleCase(),
                  style: AppTextStyle.bodyMedium(
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.blackLv1,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
