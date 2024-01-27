import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '___sample_wrapper.dart';

class AppTextStylesSamplesView extends StatefulWidget {
  const AppTextStylesSamplesView({super.key});

  static const routeName = '/atom-app-text-styles';

  @override
  State<AppTextStylesSamplesView> createState() => _AppTextStylesSamplesViewState();
}

class _AppTextStylesSamplesViewState extends State<AppTextStylesSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Styles Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultText(),
            regular(),
            medium(),
            semiBold(),
            bold(),
            heading1(),
            heading2(),
            heading3(),
            heading4(),
            heading5(),
            heading6(),
            bodyXSmall(),
            bodySmall(),
            bodyMedium(),
            bodyLarge(),
            bodyXLarge(),
            custom(),
          ],
        ),
      ),
    );
  }

  Widget defaultText() {
    return const SampleWrapper(
      title: 'Default Text',
      widget: Text(
        'Lorem ipsum dolor',
      ),
    );
  }

  Widget regular() {
    return SampleWrapper(
      title: 'Regular Text',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.regular(size: 14),
      ),
    );
  }

  Widget medium() {
    return SampleWrapper(
      title: 'Medium Text',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.medium(size: 14),
      ),
    );
  }

  Widget semiBold() {
    return SampleWrapper(
      title: 'Semi Bold Text',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.semiBold(size: 14),
      ),
    );
  }

  Widget bold() {
    return SampleWrapper(
      title: 'Bold Text',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.bold(size: 14),
      ),
    );
  }

  Widget heading1() {
    return SampleWrapper(
      title: 'Heading 1',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.heading1(),
      ),
    );
  }

  Widget heading2() {
    return SampleWrapper(
      title: 'Heading 2',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.heading2(),
      ),
    );
  }

  Widget heading3() {
    return SampleWrapper(
      title: 'Heading 3',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.heading3(),
      ),
    );
  }

  Widget heading4() {
    return SampleWrapper(
      title: 'Heading 4',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.heading4(),
      ),
    );
  }

  Widget heading5() {
    return SampleWrapper(
      title: 'Heading 5',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.heading5(),
      ),
    );
  }

  Widget heading6() {
    return SampleWrapper(
      title: 'Heading 6',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.heading6(),
      ),
    );
  }

  Widget bodyXSmall() {
    return SampleWrapper(
      title: 'Body XSmall',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.bodyXSmall(fontWeight: AppFontWeight.regular),
      ),
    );
  }

  Widget bodySmall() {
    return SampleWrapper(
      title: 'Body Small',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
      ),
    );
  }

  Widget bodyMedium() {
    return SampleWrapper(
      title: 'Body Medium',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.bodyMedium(fontWeight: AppFontWeight.regular),
      ),
    );
  }

  Widget bodyLarge() {
    return SampleWrapper(
      title: 'Body Large',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.bodyLarge(fontWeight: AppFontWeight.regular),
      ),
    );
  }

  Widget bodyXLarge() {
    return SampleWrapper(
      title: 'Body XLarge',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.bodyXLarge(fontWeight: AppFontWeight.regular),
      ),
    );
  }

  Widget custom() {
    return SampleWrapper(
      title: 'Custom',
      widget: Text(
        'Lorem ipsum dolor',
        style: AppTextStyle.custom(
          size: 16,
          color: AppColors.redLv1,
          fontFamily: 'Roboto',
          fontWeight: AppFontWeight.bold,
          height: 2,
          textDecoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
