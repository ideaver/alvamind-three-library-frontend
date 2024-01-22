import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_modal.dart';
import '___sample_wrapper.dart';

class AppModalPopupButtonSamplesView extends StatefulWidget {
  const AppModalPopupButtonSamplesView({super.key});

  static const routeName = '/organism-modal';

  @override
  State<AppModalPopupButtonSamplesView> createState() => _AppModalPopupButtonSamplesViewState();
}

class _AppModalPopupButtonSamplesViewState extends State<AppModalPopupButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLv9,
      appBar: AppBar(title: const Text('Modal Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modalPopUp(),
            modalPopUpCustom(),
            modalPopUpWithMiniTitle(),
            modalPopUpWithAddress(),
            modalPopUpWithPrice(),
            modalPopUpWithSlider(),
          ],
        ),
      ),
    );
  }

  Widget modalPopUp() {
    return SampleWrapper(
      title: 'Modal PopUp',
      widget: AppButton(
        text: 'Modal PopUp',
        onTap: () {
          final navigator = Navigator.of(context);
          AppModal.show(
            navigator,
            backgroundColor: AppColors.white,
            title: 'Modal',
            titleColor: AppColors.redLv1,
            miniTitle: 'Are you sure you want to log out?',
            subtitle: 'Lorem ipsum dolor sit amet hua qui lori ipsum sit ghui amet poety amet',
            subtitleColor: AppColors.black,
            directionButton: Axis.horizontal,
            price: false,
            children: [
              Expanded(
                child: AppButton(
                  onTap: () {},
                  text: 'Cancel',
                  textColor: AppColors.primary,
                  buttonColor: AppColors.blueLv5,
                  rounded: true,
                ),
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Expanded(
                child: AppButton(
                  onTap: () {},
                  text: 'Yes, Logout',
                  rounded: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget modalPopUpCustom() {
    return SampleWrapper(
      title: 'Modal PopUp Custom',
      widget: AppButton(
        text: 'Modal PopUp Custom',
        onTap: () {
          final navigator = Navigator.of(context);
          AppModal.show(
            navigator,
            price: false,
            backgroundColor: AppColors.white,
            children: [
              Expanded(
                child: AppButton(
                  onTap: () {},
                  text: 'Berikutnya',
                  rounded: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget modalPopUpWithMiniTitle() {
    return SampleWrapper(
      title: 'Modal PopUp with Text',
      widget: AppButton(
        text: 'Modal PopUp with Text',
        onTap: () {
          final navigator = Navigator.of(context);
          AppModal.show(
            navigator,
            backgroundColor: AppColors.white,
            title: 'Logout',
            titleColor: AppColors.redLv1,
            miniTitle: 'Are you sure you want to log out?',
            directionButton: Axis.horizontal,
            price: false,
            children: [
              Expanded(
                child: AppButton(
                  onTap: () {},
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.padding,
                  ),
                  text: 'Cancel',
                  textColor: AppColors.primary,
                  buttonColor: AppColors.blueLv5,
                  rounded: true,
                ),
              ),
              const SizedBox(width: AppSizes.padding / 2),
              Expanded(
                child: AppButton(
                  onTap: () {},
                  text: 'Yes, Logout',
                  rounded: true,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.padding,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget modalPopUpWithAddress() {
    return SampleWrapper(
      title: 'Modal PopUp with Address',
      widget: AppButton(
        text: 'Modal PopUp with Adress',
        onTap: () {
          final navigator = Navigator.of(context);
          AppModal.show(
            navigator,
            backgroundColor: AppColors.white,
            title: 'Pin Poin Alamat',
            titleColor: AppColors.black,
            directionButton: Axis.vertical,
            textAddress: true,
            price: false,
            titleAddress: 'Rancamulya',
            subtitleAddress: 'Pameungpek, Kab. Bandung, Jawa barat',
            children: [
              AppButton(
                onTap: () {},
                text: '',
                rounded: true,
                textWidget: Expanded(
                  child: Text(
                    'Pilih Lokasi dan Lanjut Isi Alamat',
                    style: AppTextStyle.bold(size: 16, color: AppColors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSizes.padding / 2,
              ),
              AppButton(
                onTap: () {},
                text: '',
                textColor: AppColors.primary,
                buttonColor: AppColors.blueLv5,
                rounded: true,
                textWidget: Expanded(
                  child: Text(
                    'Tidak Ketemu? Isi Alamat Manual',
                    style: AppTextStyle.bold(size: 16, color: AppColors.primary),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget modalPopUpWithPrice() {
    return SampleWrapper(
      title: 'Modal PopUp with Price',
      widget: AppButton(
        text: 'Modal PopUp with Price',
        onTap: () {
          final navigator = Navigator.of(context);
          AppModal.show(
            navigator,
            backgroundColor: AppColors.white,
            title: 'Logout',
            miniTitle: 'Are you sure you want to log out?',
            titleColor: AppColors.black,
            directionButton: Axis.vertical,
            price: true,
            textPrice: '29',
            statusPrice: '/night',
            children: [],
            priceButton: () {
              // TODO
            },
          );
        },
      ),
    );
  }

  Widget modalPopUpWithSlider() {
    return SampleWrapper(
      title: 'Modal PopUp with Slider',
      widget: AppButton(
        text: 'Modal PopUp with Slider',
        onTap: () {
          final navigator = Navigator.of(context);
          AppModal.show(
            navigator,
            backgroundColor: AppColors.white,
            title: 'Atur Jarak Absen',
            titleColor: AppColors.black,
            directionButton: Axis.vertical,
            price: false,
            children: [
              AppButton(
                onTap: () {},
                text: '',
                textWidget: Expanded(
                  child: Text(
                    'Pilih Lokasi dan Lanjut Isi Alamat',
                    style: AppTextStyle.bold(size: 16, color: AppColors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
                rounded: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
