import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/atom/app_avatar.dart';
import '../../widget/atom/app_divider.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/molecule/app_radio_list_tile.dart';
import '___sample_wrapper.dart';

class AppRadioListTileSamplesView extends StatefulWidget {
  const AppRadioListTileSamplesView({super.key});

  static const routeName = '/molecule-app-radio-list-tile';

  @override
  State<AppRadioListTileSamplesView> createState() => _AppRadioListTileSamplesViewState();
}

class _AppRadioListTileSamplesViewState extends State<AppRadioListTileSamplesView> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio List Tile Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultRadioListTile(),
            defaultRadioListTileWithSubtitle(),
            defaultRadioListTileWithLeftRadioPosition(),
            defaultRadioListTileWithLeadingWidget(),
            defaultRadioListTileWithCustomSubtitleWidget(),
            customRadioListTile(),
          ],
        ),
      ),
    );
  }

  Widget defaultRadioListTile() {
    return SampleWrapper(
      title: 'Default Radio List Tile',
      widget: AppRadioListTile(
        value: 1,
        groupValue: groupValue,
        title: 'Title',
        // subtitle: 'Subtitle',
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultRadioListTileWithSubtitle() {
    return SampleWrapper(
      title: 'Default Radio List Tile With Subtitle',
      widget: AppRadioListTile(
        value: 2,
        groupValue: groupValue,
        title: 'Title',
        subtitle: 'Subtitle',
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultRadioListTileWithLeftRadioPosition() {
    return SampleWrapper(
      title: 'Default Radio List Tile With Left Radio Position',
      widget: AppRadioListTile(
        value: 3,
        groupValue: groupValue,
        title: 'Title',
        subtitle: 'Subtitle',
        radioPosition: RadioPosition.left,
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultRadioListTileWithLeadingWidget() {
    return SampleWrapper(
      title: 'Default Radio List Tile With Leading Widget',
      widget: AppRadioListTile(
        value: 4,
        groupValue: groupValue,
        title: 'Title',
        subtitle: 'Subtitle',
        leadingWidget: const Row(
          children: [
            AppImage(
              image: AppAssets.bankBCA,
              imgProvider: ImgProvider.assetImage,
              enableFullScreenView: false,
              height: 36,
              // Remove this
              isFromAppAssets: false,
            ),
            AppDivider(
              type: DividerType.dashed,
              direction: Axis.vertical,
              height: AppSizes.padding * 2,
              padding: EdgeInsets.only(left: AppSizes.padding, right: AppSizes.padding / 2),
            ),
          ],
        ),
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultRadioListTileWithCustomSubtitleWidget() {
    return SampleWrapper(
      title: 'Default Radio List Tile With Custom Subtitle Widget',
      widget: AppRadioListTile(
        value: 4,
        groupValue: groupValue,
        title: 'Title',
        subtitleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subtitle',
              style: AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
            ),
            const SizedBox(height: 4),
            Text(
              'Subtitle',
              style: AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
            ),
          ],
        ),
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }

  Widget customRadioListTile() {
    return SampleWrapper(
      title: 'Custom Radio List Tile',
      widget: AppRadioListTile(
        value: 5,
        groupValue: groupValue,
        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        subtitle:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ullamcorper eros imperdiet risus vehicula congue.',
        titleStyle: AppTextStyle.bold(size: 18),
        subtitleStyle: AppTextStyle.medium(size: 11, color: AppColors.redLv1),
        activeBorderColor: AppColors.orangeLv1,
        inactiveBorderColor: AppColors.orangeLv6,
        activeTileColor: AppColors.yellowLv6,
        inactiveTileColor: AppColors.white,
        radioFillColor: AppColors.orangeLv1,
        borderRadius: 100,
        borderWidth: 2,
        padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 1.5, horizontal: AppSizes.padding),
        leadingWidget: const AppAvatar(
          image: randomImage,
          size: 40,
          borderWidth: 2,
          enableFullScreenView: false,
          enabledColor: AppColors.orangeLv4,
        ),
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }
}
