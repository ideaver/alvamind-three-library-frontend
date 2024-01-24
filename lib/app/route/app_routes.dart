import 'package:flutter/material.dart';

import '../../view/main/main_view.dart';
import '../../view/samples/app_avatar_samples_view.dart';
import '../../view/samples/app_button_samples_view.dart';
import '../../view/samples/app_carousel_slider_samples_view.dart';
import '../../view/samples/app_checkbox_samples_view.dart';
import '../../view/samples/app_chips_samples_view.dart';
import '../../view/samples/app_colors_samples_view.dart';
import '../../view/samples/app_dialog_samples_view.dart';
import '../../view/samples/app_divider_samples_view.dart';
import '../../view/samples/app_dotted_border_sample_view.dart';
import '../../view/samples/app_dropdown_samples_view.dart';
import '../../view/samples/app_icon_button_samples_view.dart';
import '../../view/samples/app_image_samples_view.dart';
import '../../view/samples/app_logo_samples_view.dart';
import '../../view/samples/app_maps_samples_view.dart';
import '../../view/samples/app_modal_samples_view.dart';
import '../../view/samples/app_progress_indicator_samples_view.dart';
import '../../view/samples/app_progress_line_samples_view.dart';
import '../../view/samples/app_radio_samples_view.dart';
import '../../view/samples/app_segmented_tab_bar_samples_view.dart';
import '../../view/samples/app_snackbar_samples_view.dart';
import '../../view/samples/app_steps_samples_view.dart';
import '../../view/samples/app_swipe_indicator_samples_view.dart';
import '../../view/samples/app_table_navigation_samples_view.dart';
import '../../view/samples/app_table_samples_view.dart';
import '../../view/samples/app_tags_samples_view.dart';
import '../../view/samples/app_text_field_samples_view.dart';
import '../../view/samples/app_text_styles_samples_view.dart';
import '../../view/samples/app_toggle_samples_view.dart';
import '../../view/samples/app_tool_tip_menu_samples_view.dart';
import '../../view/samples/icons_samples_view.dart';
import '../../view/samples/illustrations_samples_view.dart';

// App routes
class AppRoutes {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  AppRoutes._();

  static Map<String, WidgetBuilder> routes = {
    MainView.routeName: (context) => const MainView(),
    IconsSamplesView.routeName: (context) => const IconsSamplesView(),
    IllustrationsSamplesView.routeName: (context) => const IllustrationsSamplesView(),
    AppTextStylesSamplesView.routeName: (context) => const AppTextStylesSamplesView(),
    AppColorsSamplesView.routeName: (context) => const AppColorsSamplesView(),
    AppButtonSamplesView.routeName: (context) => const AppButtonSamplesView(),
    AppDialogSamplesView.routeName: (context) => const AppDialogSamplesView(),
    AppProgressIndicatorSamplesView.routeName: (context) => const AppProgressIndicatorSamplesView(),
    AppAvatarSamplesView.routeName: (context) => const AppAvatarSamplesView(),
    AppMapsSamplesView.routeName: (context) => const AppMapsSamplesView(),
    AppIconButtonSamplesView.routeName: (context) => const AppIconButtonSamplesView(),
    AppChipsSamplesView.routeName: (context) => const AppChipsSamplesView(),
    AppTagsSamplesView.routeName: (context) => const AppTagsSamplesView(),
    AppSegmentedTabBarSamplesView.routeName: (context) => const AppSegmentedTabBarSamplesView(),
    AppTextFieldSamplesView.routeName: (context) => const AppTextFieldSamplesView(),
    AppToolTipMenuSamples.routeName: (context) => const AppToolTipMenuSamples(),
    AppDividerSamplesView.routeName: (context) => const AppDividerSamplesView(),
    AppLogoSamplesView.routeName: (context) => const AppLogoSamplesView(),
    AppImageSamplesView.routeName: (context) => const AppImageSamplesView(),
    AppProgressLineSamplesView.routeName: (context) => const AppProgressLineSamplesView(),
    AppDropDownSamplesView.routeName: (context) => const AppDropDownSamplesView(),
    AppToggleSamplesView.routeName: (context) => const AppToggleSamplesView(),
    AppModalPopupButtonSamplesView.routeName: (context) => const AppModalPopupButtonSamplesView(),
    AppDottedBorderSamplesView.routeName: (context) => const AppDottedBorderSamplesView(),
    AppCheckboxSamplesView.routeName: (context) => const AppCheckboxSamplesView(),
    AppRadioSamplesView.routeName: (context) => const AppRadioSamplesView(),
    AppTableSamplesView.routeName: (context) => const AppTableSamplesView(),
    AppTableNavigationSamplesView.routeName: (context) => const AppTableNavigationSamplesView(),
    AppSnackbarSamplesView.routeName: (context) => const AppSnackbarSamplesView(),
    AppStepsSamplesView.routeName: (context) => const AppStepsSamplesView(),
    AppSwipeIndicatorSamplesView.routeName: (context) => const AppSwipeIndicatorSamplesView(),
    AppCarouselSliderSamplesView.routeName: (context) => const AppCarouselSliderSamplesView(),
  };
}
