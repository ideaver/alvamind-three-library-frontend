import 'package:flutter/material.dart';

import '../../widget/molecule/app_table_navigation.dart';
import '___sample_wrapper.dart';

class AppTableNavigationSamplesView extends StatefulWidget {
  const AppTableNavigationSamplesView({super.key});

  static const routeName = '/molecule-app-table-navigation';

  @override
  State<AppTableNavigationSamplesView> createState() => _AppTableNavigationSamplesViewState();
}

class _AppTableNavigationSamplesViewState extends State<AppTableNavigationSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Navigation Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTableNavigation(),
            tableNavigationWithoutTitle(),
            tableNavigationOnlyNavButtons(),
            tableNavigationPrevAndNextOnly(),
            tableNavigationFirstAndLastOnly(),
          ],
        ),
      ),
    );
  }

  Widget defaultTableNavigation() {
    return SampleWrapper(
      title: 'Default Table Navigation (Responsive)',
      widget: Center(
        child: AppTableNavigation(
          title: 'Rows per page',
          maxRows: 25,
          maxPageIndex: 10,
          currentPageIndex: 1,
          onSelectedMaxRows: (i) {},
          onTapFirstPage: () {},
          onTapLastPage: () {},
          onTapNextPage: () {},
          onTapPrevPage: () {},
        ),
      ),
    );
  }

  Widget tableNavigationWithoutTitle() {
    return SampleWrapper(
      title: 'Table Navigation Without Rows Title',
      widget: Center(
        child: AppTableNavigation(
          maxRows: 25,
          maxPageIndex: 10,
          currentPageIndex: 1,
          onSelectedMaxRows: (i) {},
          onTapFirstPage: () {},
          onTapLastPage: () {},
          onTapNextPage: () {},
          onTapPrevPage: () {},
        ),
      ),
    );
  }

  Widget tableNavigationWithoutTitleAndRows() {
    return SampleWrapper(
      title: 'Table Navigation Without Rows Title & Rows Dropdown',
      widget: Center(
        child: AppTableNavigation(
          maxPageIndex: 10,
          currentPageIndex: 1,
          onSelectedMaxRows: (i) {},
          onTapFirstPage: () {},
          onTapLastPage: () {},
          onTapNextPage: () {},
          onTapPrevPage: () {},
        ),
      ),
    );
  }

  Widget tableNavigationOnlyNavButtons() {
    return SampleWrapper(
      title: 'Table Navigation Only Nav. Buttons',
      widget: Center(
        child: AppTableNavigation(
          onSelectedMaxRows: (i) {},
          onTapFirstPage: () {},
          onTapLastPage: () {},
          onTapNextPage: () {},
          onTapPrevPage: () {},
        ),
      ),
    );
  }

  Widget tableNavigationPrevAndNextOnly() {
    return SampleWrapper(
      title: 'Table Navigation Prev. & Next Only',
      widget: Center(
        child: AppTableNavigation(
          onTapNextPage: () {},
          onTapPrevPage: () {},
        ),
      ),
    );
  }

  Widget tableNavigationFirstAndLastOnly() {
    return SampleWrapper(
      title: 'Table Navigation First & Last Only',
      widget: Center(
        child: AppTableNavigation(
          onTapFirstPage: () {},
          onTapLastPage: () {},
        ),
      ),
    );
  }
}
