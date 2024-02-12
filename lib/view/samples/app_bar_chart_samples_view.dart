import 'package:alvamind_three_library_frontend/view/samples/___sample_wrapper.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_leadearboard_list.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_modal_referral.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_tab_button_group.dart';
import 'package:alvamind_three_library_frontend/widget/organism/bar_chart/bar_chart.dart';
import 'package:alvamind_three_library_frontend/widget/organism/bar_chart/bar_chart_group_data.dart';
import 'package:alvamind_three_library_frontend/widget/organism/bar_chart/chart.dart';
import 'package:alvamind_three_library_frontend/widget/organism/tags_organism.dart/tags_organism.dart';
import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/organism/bar_chart_riwayat_transaksi/bar_chart_riwayat.dart';
import '../../widget/organism/bar_chart_riwayat_transaksi/bar_chart_group_data_riwayat.dart';
import '../../widget/organism/bar_chart_riwayat_transaksi/chart_riwayat.dart';

class BarChartSamplesView extends StatefulWidget {
  const BarChartSamplesView({Key? key}) : super(key: key);

  static const routeName = '/organism-bar-chart-samples';

  @override
  State<BarChartSamplesView> createState() => _BarChartSamplesViewState();
}

class _BarChartSamplesViewState extends State<BarChartSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bar Chart Samples')),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [barChartRiwayat(), barChartLaba(), barChartOmzet()],
      ),
    );
  }

  int tagSelected = 0;
  String selectedOptionDate = '6 bulan';

  Widget barChartRiwayat() {
    return SampleWrapper(
      title: 'Bar Chart Riwayat',
      widget: BarChartRiwayat(
        selectedOptionDate: selectedOptionDate,
        onTapDate: () {
          dateModalBottomSheet(context);
        },
        textTypeChart: 'Riwayat',
        textDateRange: '1 Jan 2023 - 31 Juli 2023',
        countTotal: '1.000 Transaksi',
        countTotalColor: AppColors.redLv1,
        countTransaction: 'Total Penjualan Link dan Kupon',
        onTapItem: (value) {},
        tagBar: AppTabButtonGroup(
            onTap: (value) {
              setState(() {
                tagSelected = value;
              });
            },
            options: const [
              'Semua',
              'Link',
              'Cupon'
            ],
            pages: [
              generateListTiles('Semua'),
              generateListTiles('Link'),
              generateListTiles('Cupon'),
            ]),
        barChart: tagSelected == 0
            ? ChartRiwayat(
                tagSelected: tagSelected,
                listValueChart: [
                  generateGroupDataSemuaRiwayat(1, 5, 5),
                  generateGroupDataSemuaRiwayat(1, 4, 2),
                  generateGroupDataSemuaRiwayat(4, 2, 2),
                  generateGroupDataSemuaRiwayat(3, 3, 3),
                  generateGroupDataSemuaRiwayat(3, 1, 2),
                  generateGroupDataSemuaRiwayat(5, 2, 1),
                ],
              )
            : tagSelected == 1
                ? ChartRiwayat(
                    tagSelected: tagSelected,
                    listValueChart: [
                      generateGroupDataLinkRiwayat(
                        1,
                        5,
                      ),
                      generateGroupDataLinkRiwayat(
                        0,
                        4,
                      ),
                      generateGroupDataLinkRiwayat(
                        4,
                        2,
                      ),
                      generateGroupDataLinkRiwayat(
                        3,
                        5,
                      ),
                      generateGroupDataLinkRiwayat(
                        3,
                        1,
                      ),
                      generateGroupDataLinkRiwayat(
                        5,
                        2,
                      ),
                    ],
                  )
                : ChartRiwayat(
                    tagSelected: tagSelected,
                    listValueChart: [
                      generateGroupDataCuponRiwayat(
                        1,
                        5,
                      ),
                      generateGroupDataCuponRiwayat(
                        0,
                        4,
                      ),
                      generateGroupDataCuponRiwayat(
                        4,
                        2,
                      ),
                      generateGroupDataCuponRiwayat(
                        3,
                        5,
                      ),
                      generateGroupDataCuponRiwayat(
                        3,
                        1,
                      ),
                      generateGroupDataCuponRiwayat(
                        5,
                        2,
                      ),
                    ],
                  ),
      ),
    );
  }

  Widget generateListTiles(String category) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        if (category == 'Semua') {
          if (index % 2 == 0) {
            return generateListTile('Link', index ~/ 2);
          } else {
            return generateListTile('Cupon', index ~/ 2);
          }
        } else {
          return generateListTile(category, index);
        }
      },
    );
  }

  Widget generateListTile(String type, int index) {
    return AppLeaderboardList(
        color: type == 'Link' ? AppColors.cyanLv1 : AppColors.redLv1,
        image: randomImage,
        titleText: 'John Doe',
        subtitleText: 'Sent on 26 Jan 2023',
        typeText: type);
  }

  void dateModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (BuildContext context) {
        return AppModalReferral(
          selectedOption: selectedOptionDate,
          onSelect: (value) {
            setState(() {
              selectedOptionDate = value;
            });
          },
        );
      },
    );
  }

  Widget barChartOmzet() {
    return SampleWrapper(
      title: 'Bar Chart Omzet',
      widget: BarChart(
          selectedOptionDate: selectedOptionDate,
          onTapDate: () {
            dateModalBottomSheet(context);
          },
          textTypeChart: 'Omzet',
          textDateRange: '1 Jan 2023 - 31 Juli 2023',
          countTotal: 'Rp. 687.375.337',
          countTransaction: '1000',
          onTapItem: (value) {},
          tagBar: TagsOrganism(
            listChips: const [
              'Kategori 1',
              'Kategori 2',
              'Kategori 3',
              'Kategori 4',
            ],
            selected: -1,
            onTap: (value) {
              // TODO
              setState(() {
                tagSelected = value;
              });
            },
          ),
          barChart: tagSelected == 0
              ? Chart(
                  tagSelected: tagSelected,
                  listValueChart: [
                    generateGroupDataOmzet(0, 1, 2, 2, 2),
                    generateGroupDataOmzet(1, 2, 1, 1.2, 2),
                    generateGroupDataOmzet(2, 1, 2, 1.2, 2),
                    generateGroupDataOmzet(3, 2, 2, 1.1, 2),
                    generateGroupDataOmzet(4, 2, 1, 1.4, 2),
                    generateGroupDataOmzet(5, 2, 2, 1.4, 2),
                  ],
                )
              : tagSelected == 1
                  ? Chart(
                      tagSelected: tagSelected,
                      listValueChart: [
                        generateGroupDataOmzet(0, 1, 2, 2, 2),
                        generateGroupDataOmzet(1, 2, 1, 1.2, 2),
                        generateGroupDataOmzet(2, 2, 2, 1.4, 2),
                        generateGroupDataOmzet(3, 1, 2, 1.2, 2),
                        generateGroupDataOmzet(4, 2, 1, 1.4, 2),
                        generateGroupDataOmzet(5, 2, 2, 1.1, 2),
                      ],
                    )
                  : tagSelected == 2
                      ? Chart(
                          tagSelected: tagSelected,
                          listValueChart: [
                            generateGroupDataOmzet(0, 2, 1, 1.2, 2),
                            generateGroupDataOmzet(1, 1, 2, 2, 2),
                            generateGroupDataOmzet(2, 2, 2, 1.1, 2),
                            generateGroupDataOmzet(3, 2, 2, 1.4, 2),
                            generateGroupDataOmzet(4, 1, 2, 1.2, 2),
                            generateGroupDataOmzet(5, 2, 1, 1.4, 2),
                          ],
                        )
                      : Chart(
                          tagSelected: tagSelected,
                          listValueChart: [
                            generateGroupDataOmzet(0, 2, 1, 1.2, 2),
                            generateGroupDataOmzet(1, 2, 1, 1.4, 2),
                            generateGroupDataOmzet(2, 1, 2, 1.2, 2),
                            generateGroupDataOmzet(3, 1, 2, 2, 2),
                            generateGroupDataOmzet(4, 2, 2, 1.1, 2),
                            generateGroupDataOmzet(5, 2, 2, 1.4, 2),
                          ],
                        )),
    );
  }

  int tagSelected2 = 0;
  int tagSelected3 = 0;
  Widget barChartLaba() {
    return SampleWrapper(
      title: 'Bar Chart Laba',
      widget: BarChart(
        selectedOptionDate: selectedOptionDate,
        onTapDate: () {
          dateModalBottomSheet(context);
        },
        textTypeChart: 'Laba Rugi',
        textDateRange: '1 Jan 2023 - 31 Juli 2023',
        countTotal: '- Rp687.375.337',
        countTotalColor: AppColors.redLv1,
        countTransaction: '1000',
        onTapItem: (value) {},
        tagBar: TagsOrganism(
          listChips: const [
            'Pemasukan',
            'Pengeluaran',
          ],
          onTap: (value) {
            // TODO
            setState(() {
              tagSelected3 = value;
            });
          },
        ),
        barChart: tagSelected3 == 0
            ? Chart(
                tagSelected: tagSelected,
                listValueChart: [
                  generateGroupDataProfit(0, 4, 5),
                  generateGroupDataProfit(1, 4, 2),
                  generateGroupDataProfit(4, 2, 2),
                  generateGroupDataProfit(2, 2, 1),
                  generateGroupDataProfit(3, 1, 2),
                  generateGroupDataProfit(5, 2, 1),
                ],
              )
            : Chart(
                tagSelected: tagSelected,
                listValueChart: [
                  generateGroupDataProfit(0, 4, 5),
                  generateGroupDataProfit(1, 1, 2),
                  generateGroupDataProfit(2, 2, 1),
                  generateGroupDataProfit(3, 2, 2),
                  generateGroupDataProfit(4, 2, 2),
                  generateGroupDataProfit(5, 2, 1),
                ],
              ),
      ),
    );
  }
}
