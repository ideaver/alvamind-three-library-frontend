import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/table_model.dart';
import '../../widget/molecule/app_checkbox.dart';
import '../../widget/molecule/app_table.dart';
import 'sample_wrapper.dart';

class TableSamplesView extends StatefulWidget {
  const TableSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-table-samples';

  @override
  State<TableSamplesView> createState() => _TableSamplesViewState();
}

class _TableSamplesViewState extends State<TableSamplesView> {
  List<TableModel> headerData = [
    TableModel(
      expanded: false,
      child: AppCheckbox(
        value: true,
        fillColor: AppColors.blackLv1,
        onChanged: (val) {},
      ),
    ),
    TableModel(
      data: 'Header 1',
      textStyle: AppTextStyle.bodyMedium(
        fontWeight: AppFontWeight.bold,
      ),
    ),
    TableModel(
      data: 'Header 2',
      textStyle: AppTextStyle.bodyMedium(
        fontWeight: AppFontWeight.bold,
      ),
    ),
    TableModel(
      data: 'Header 3',
      textStyle: AppTextStyle.bodyMedium(
        fontWeight: AppFontWeight.bold,
      ),
    ),
    TableModel(
      data: 'Header 4',
      textStyle: AppTextStyle.bodyMedium(
        fontWeight: AppFontWeight.bold,
      ),
    ),
  ];

  List<List<TableModel>> data = [
    ...List.generate(
      4,
      (index) => [
        TableModel(
          expanded: false,
          child: AppCheckbox(
            value: false,
            fillColor: AppColors.blackLv1,
            onChanged: (val) {},
          ),
        ),
        TableModel(data: 'Data $index'),
        TableModel(data: 'Data $index'),
        TableModel(data: 'Data $index'),
        TableModel(data: 'Data $index'),
      ],
    )
  ];

  List<List<TableModel>> dataCustom = [
    ...List.generate(
      4,
      (index) => [
        TableModel(
          expanded: false,
          child: AppCheckbox(
            value: false,
            fillColor: AppColors.blackLv1,
            onChanged: (val) {},
          ),
        ),
        TableModel(data: 'Data $index', color: AppColors.redLv6),
        TableModel(data: 'Data $index'),
        TableModel(data: 'Data $index', color: AppColors.redLv6),
        TableModel(data: 'Data $index'),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTable(),
            defaultTableWithTitle(),
            defaultTableWithoutHeader(),
            customTable(),
          ],
        ),
      ),
    );
  }

  Widget defaultTable() {
    return SampleWrapper(
      title: 'Default Table',
      widget: AppTable(
        headerData: headerData,
        data: data,
      ),
    );
  }

  Widget defaultTableWithTitle() {
    return SampleWrapper(
      title: 'Default Table With Title',
      widget: AppTable(
        title: 'Title',
        headerData: headerData,
        data: data,
      ),
    );
  }

  Widget defaultTableWithoutHeader() {
    return SampleWrapper(
      title: 'Default Table Without Header',
      widget: AppTable(
        // headerData: headerData,
        data: data,
      ),
    );
  }

  Widget customTable() {
    return SampleWrapper(
      title: 'Custom Table',
      widget: AppTable(
        title: 'This Is Custom Table',
        headerData: headerData,
        data: dataCustom,
        headerBackgroundColor: AppColors.blueLv5,
        backgroundColor: AppColors.blackLv9,
        bottomBorderWidth: 1,
        headerBottomBorderWidth: 1,
        bottomBorderColor: AppColors.blackLv7,
        headerBottomBorderColor: AppColors.blueLv1,
        borderRadius: 8,
        tableBorderWidth: 1,
        tableBorderColor: AppColors.blackLv7,
      ),
    );
  }
}
