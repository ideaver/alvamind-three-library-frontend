import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_button.dart';
import 'list_menu_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  static const routeName = '/main';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'EksporYuk',
                    style: AppTextStyle.heading4(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'EksporYuk Design System',
                    style: AppTextStyle.bodyMedium(
                      fontWeight: AppFontWeight.medium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListMenuView(),
                  ),
                ),
                text: "List Widgets",
              ),
            )
          ],
        ),
      ),
    );
  }
}
