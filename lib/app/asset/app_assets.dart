import 'package:flutter/material.dart';

class AppAssets {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  AppAssets._();

  // AppAssets package name
  // Must be same with this package name so you can load assetss from another package/project
  static const String appAssetsPackageName = 'alvamind_three_library_frontend';

  // Logo
  static const String logo = 'lib/assets/images/logo.png';

  // Placeholder
  static const String user = 'lib/assets/images/user.png';
  static const String loadingGif = 'lib/assets/images/loading.gif';
  static const String emptyPlaceholder =
      'lib/assets/images/empty_placeholder.png';

  // Image Icons
  static const String flagID = 'lib/assets/images/icons/flags/ID.png';
  static const String flagUS = 'lib/assets/images/icons/flags/US.png';
  static const String mastercard =
      'lib/assets/images/icons/payments/mastercard-icon.png';
  static const String paypal =
      'lib/assets/images/icons/payments/paypal-icon.png';
  static const String gpay =
      'lib/assets/images/icons/payments/googlepay-icon.png';
  static const String applepay =
      'lib/assets/images/icons/payments/applepay-icon.png';
  static const String bankBNI = 'lib/assets/images/icons/banks/bni.png';
  static const String bankBCA = 'lib/assets/images/icons/banks/bca.png';
  static const String bankMandiri = 'lib/assets/images/icons/banks/mandiri.png';
  static const String bankBRI = 'lib/assets/images/icons/banks/bri.png';
  static const String performance =
      'lib/assets/images/icons/menus/performance.png';
  static const String product = 'lib/assets/images/icons/menus/product.png';
  static const String feeds = 'lib/assets/images/icons/menus/feeds.png';
  static const String history = 'lib/assets/images/icons/menus/history.png';
  static const String urlShortener =
      'lib/assets/images/icons/menus/url_shortener.png';
  static const String competitor =
      'lib/assets/images/icons/menus/competitor.png';
  static const String activity = 'lib/assets/images/icons/menus/activity.png';
  static const String faq = 'lib/assets/images/icons/menus/faq.png';

  // Illustrations
  static const String checklistLight =
      'lib/assets/images/illustrations/light_checklist.png';
  static const String faceIdLight =
      'lib/assets/images/illustrations/light_face_id.png';
  static const String fingerprintLight =
      'lib/assets/images/illustrations/light_fingerprint.png';
  static const String cubeImage = 'lib/assets/images/cube-image.png';
  static const String nodataLight =
      'lib/assets/images/illustrations/light_nodata.png';
  static const String referralLight =
      'lib/assets/images/illustrations/light_referral.png';
  static const String successLight =
      'lib/assets/images/illustrations/light_success.png';
  static const String checklistDark =
      'lib/assets/images/illustrations/dark_checklist.png';
  static const String faceIdDark =
      'lib/assets/images/illustrations/dark_face_id.png';
  static const String fingerprintDark =
      'lib/assets/images/illustrations/dark_fingerprint.png';
  static const String nodataDark =
      'lib/assets/images/illustrations/dark_nodata.png';
  static const String referralDark =
      'lib/assets/images/illustrations/dark_referral.png';
  static const String successDark =
      'lib/assets/images/illustrations/dark_success.png';

  // Onboarding
  static const String ob1Light =
      'lib/assets/images/illustrations/onboarding/light_ob1.png';
  static const String ob2Light =
      'lib/assets/images/illustrations/onboarding/light_ob2.png';
  static const String ob3Light =
      'lib/assets/images/illustrations/onboarding/light_ob3.png';
  static const String ob4Light =
      'lib/assets/images/illustrations/onboarding/light_ob4.png';
  static const String ob5Light =
      'lib/assets/images/illustrations/onboarding/light_ob5.png';
  static const String ob6Light =
      'lib/assets/images/illustrations/onboarding/light_ob6.png';
  static const String ob1Dark =
      'lib/assets/images/illustrations/onboarding/dark_ob1.png';
  static const String ob2Dark =
      'lib/assets/images/illustrations/onboarding/dark_ob2.png';
  static const String ob3Dark =
      'lib/assets/images/illustrations/onboarding/dark_ob3.png';
  static const String ob4Dark =
      'lib/assets/images/illustrations/onboarding/dark_ob4.png';
}

class CustomIcon {
  CustomIcon._();

  static const _kFontFam = 'CustomIcon';
  static const String _kFontPkg = 'alvamind_library';

  static const IconData heartIcon =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData doc_text =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData boxIcon =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cameraIcon =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData editIcon =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData contactIcon =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconArrowDown =
      IconData(0xe80f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconArrowRight =
      IconData(0xe810, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData scanIcon =
      IconData(0xe811, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData homeIcon =
      IconData(0xe812, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chatIcon =
      IconData(0xe813, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sendIcon =
      IconData(0xe815, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData threeUserBoldIcon =
      IconData(0xe816, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData editPenIcon =
      IconData(0xe818, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData buildingIcon =
      IconData(0xe81a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData truckFastIcon =
      IconData(0xe819, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData convert3dCubeIcon =
      IconData(0xe81b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData documentIcon =
      IconData(0xe81c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData walletIcon =
      IconData(0xe81d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData threeUserIcon =
      IconData(0xe81e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData withdrawBoldIcon =
      IconData(0xe81f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sendBoldIcon =
      IconData(0xe821, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData voiceBoldIcon =
      IconData(0xe822, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chatBoldIcon =
      IconData(0xe823, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chartBoldIcon =
      IconData(0xe824, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData calendarIcon =
      IconData(0xe825, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData heartBoldIcon =
      IconData(0xe826, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData discountBoldIcon =
      IconData(0xe827, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData timesquareIcon =
      IconData(0xe828, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData chartCurvedIcon =
      IconData(0xe829, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData speakerIcon =
      IconData(0xe82a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData documentBoldIcon =
      IconData(0xe82b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData walletBoldIcon =
      IconData(0xe82c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData loginIcon =
      IconData(0xe82d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData logoutIcon =
      IconData(0xe82e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData paperDownloadIcon =
      IconData(0xe82f, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData copyIcon =
      IconData(0xe830, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData downloadIcon =
      IconData(0xe831, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData infoSquareIcon =
      IconData(0xe832, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData categoryIcon =
      IconData(0xe833, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData messageicon =
      IconData(0xe834, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData arrowLeftIcon =
      IconData(0xe835, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData downloadBoldIcon =
      IconData(0xe836, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData notificationIcon =
      IconData(0xe837, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData messageOutlinedIcon =
      IconData(0xe838, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class CustomImage {
  static assets(String path) => Image.asset(path, package: 'alvamind_library');
}
