import '../../model/country_model.dart';
import '../asset/app_assets.dart';

List<CountryModel> countries = [
  CountryModel(
    name: 'Indonesia',
    countryCode: 'ID',
    languageCode: 'id',
    phoneCode: '+62',
    flag: AppAssets.flagID,
  ),
  CountryModel(
    name: 'USA',
    countryCode: 'US',
    languageCode: 'en',
    phoneCode: '+1',
    flag: AppAssets.flagUS,
  ),
];
