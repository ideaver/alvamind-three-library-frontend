import 'package:flutter/material.dart';

import '../../view/main/main_view.dart';
import '../../view/samples/avatar_samples_view.dart';
import '../../view/samples/button_samples_view.dart';
import '../../view/samples/checkbox_samples_view.dart';
import '../../view/samples/chips_samples_view.dart';
import '../../view/samples/dialog_samples_view.dart';
import '../../view/samples/divider_samples_view.dart';
import '../../view/samples/dotted_border_sample_view.dart';
import '../../view/samples/dropdown_samples_view.dart';
import '../../view/samples/icon_button_samples_view.dart';
import '../../view/samples/icons_samples_view.dart';
import '../../view/samples/image_samples_view.dart';
import '../../view/samples/input_field_samples_view.dart';
import '../../view/samples/loading_samples_view.dart';
import '../../view/samples/logo_samples_view.dart';
import '../../view/samples/modal_samples_view.dart';
import '../../view/samples/progress_line_samples_view.dart';
import '../../view/samples/radio_samples_view.dart';
import '../../view/samples/snackbar_samples_view.dart';
import '../../view/samples/steps_samples_view.dart';
import '../../view/samples/table_navigation_samples_view.dart';
import '../../view/samples/table_samples_view.dart';
import '../../view/samples/tags_samples_view.dart';
import '../../view/samples/text_samples_view.dart';
import '../../view/samples/toggle_samples_view.dart';
import '../../view/samples/tool_tip_menu_samples_view.dart';

// App routes
class AppRoutes {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  AppRoutes._();

  static Map<String, WidgetBuilder> routes = {
    MainView.routeName: (context) => const MainView(),
    TextSamplesView.routeName: (context) => const TextSamplesView(),
    IconsSamplesView.routeName: (context) => const IconsSamplesView(),
    ButtonSamplesView.routeName: (context) => const ButtonSamplesView(),
    DialogSamplesView.routeName: (context) => const DialogSamplesView(),
    LoadingSamplesView.routeName: (context) => const LoadingSamplesView(),
    AvatarSamplesView.routeName: (context) => const AvatarSamplesView(),
    IconButtonSamplesView.routeName: (context) => const IconButtonSamplesView(),
    ChipsSamplesView.routeName: (context) => const ChipsSamplesView(),
    TagsSamplesView.routeName: (context) => const TagsSamplesView(),
    InputFieldSamplesView.routeName: (context) => const InputFieldSamplesView(),
    ToolTipMenuSamples.routeName: (context) => const ToolTipMenuSamples(),
    DividerSamplesView.routeName: (context) => const DividerSamplesView(),
    LogoSamplesView.routeName: (context) => const LogoSamplesView(),
    ImageSamplesView.routeName: (context) => const ImageSamplesView(),
    ProgressLineSamplesView.routeName: (context) => const ProgressLineSamplesView(),
    DropDownSamplesView.routeName: (context) => const DropDownSamplesView(),
    ToggleSamplesView.routeName: (context) => const ToggleSamplesView(),
    ModalPopupButtonSamplesView.routeName: (context) => const ModalPopupButtonSamplesView(),
    DottedBorderSamplesView.routeName: (context) => const DottedBorderSamplesView(),
    CheckboxSamplesView.routeName: (context) => const CheckboxSamplesView(),
    RadioSamplesView.routeName: (context) => const RadioSamplesView(),
    TableSamplesView.routeName: (context) => const TableSamplesView(),
    TableNavigationSamplesView.routeName: (context) => const TableNavigationSamplesView(),
    SnackbarSamplesView.routeName: (context) => const SnackbarSamplesView(),
    StepsSamplesView.routeName: (context) => const StepsSamplesView(),
  };
}
