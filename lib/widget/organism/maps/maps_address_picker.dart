import 'package:alvamind_three_library_frontend/app/service/location/location_service.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_shadows.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/model/location_model.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_maps.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_appbar.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsAddressPicker extends StatefulWidget {
  const MapsAddressPicker({super.key});

  @override
  State<MapsAddressPicker> createState() => _MapsAddressPickerState();
}

class _MapsAddressPickerState extends State<MapsAddressPicker> {
  late GoogleMapController mapController;

  LatLng? currentLocation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initLocation();
    });
    super.initState();
  }

  void initLocation() async {
    final navigator = Navigator.of(context);

    await LocationService.getCurrentPosition(
      onServiceDisabled: () {
        AppDialog.show(navigator,
            dismissible: false,
            title: "Service Disabled",
            child: Text(
              "Please enable location service on your system settings",
              style: AppTextStyle.bodyMedium(
                fontWeight: AppFontWeight.medium,
              ),
            ),
            leftButtonText: "Close",
            rightButtonText: "Open Settings", onTapLeftButton: () {
          Navigator.pop(context);
          Navigator.pop(context);
        }, onTapRightButton: () {
          // TODO OPEN SETTINGS
        });
      },
      onPermissionDenied: () {
        AppDialog.show(navigator,
            dismissible: false,
            title: "Permission Denied",
            child: Text(
              "Please allow location permission",
              style: AppTextStyle.bodyMedium(
                fontWeight: AppFontWeight.medium,
              ),
            ),
            leftButtonText: "Close",
            rightButtonText: "Allow", onTapLeftButton: () {
          Navigator.pop(context);
        }, onTapRightButton: () {
          LocationService.getCurrentPosition(
            onServiceDisabled: () {},
            onPermissionDenied: () {},
          );
        });
      },
    );

    currentLocation = LatLng(
      LocationService.locationData?.latitude ?? 0,
      LocationService.locationData?.longitude ?? 0,
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(
        title: "Tentukan Pinpoint Lokasi",
      ),
      body: body(),
    );
  }

  Widget body() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AppMaps(
          lat: LocationService.locationData?.latitude ?? 0,
          lng: LocationService.locationData?.longitude ?? 0,
          onMapCreated: (p0) {
            mapController = p0;
          },
          onCameraMove: (camera) {
            currentLocation = LatLng(
              camera.target.latitude,
              camera.target.longitude,
            );
            setState(() {});
          },
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 52 / 1.5),
            child: Icon(
              Icons.location_on_rounded,
              color: AppColors.redLv2,
              size: 50,
            ),
          ),
        ),
        bottomWidget(),
      ],
    );
  }

  Widget bottomWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding,
        vertical: AppSizes.padding * 1.5,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [AppShadows.darkShadow5Reversed],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lokasi",
            style: AppTextStyle.bodyMedium(
              fontWeight: AppFontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSizes.padding / 4),
          Text(
            // TODO GET LOCATION PLACE NAME USING GOOGLE PLACEE API
            "(${currentLocation?.latitude ?? 0}, ${currentLocation?.longitude ?? 0})",
            style: AppTextStyle.bodySmall(
              fontWeight: AppFontWeight.regular,
              color: AppColors.blackLv4,
            ),
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            text: "Pilih Lokasi",
            onTap: () {
              // TODO GET LOCATION PLACE NAME USING GOOGLE PLACEE API
              LocationModel locationModel = LocationModel(
                label: "${currentLocation?.latitude},  ${currentLocation?.longitude}",
                name: "${currentLocation?.latitude}, ${currentLocation?.longitude}",
                latitude: currentLocation?.latitude ?? 0,
                longitude: currentLocation?.longitude ?? 0,
              );

              Navigator.pop(context, locationModel);
            },
          ),
        ],
      ),
    );
  }
}
