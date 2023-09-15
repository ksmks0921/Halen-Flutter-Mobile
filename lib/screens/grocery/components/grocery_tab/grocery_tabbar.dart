import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/app_state.dart';
import 'package:halen_customer_app/constants/constants.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_tab/grocery_tab_content.dart';
import 'package:logger/logger.dart';

class GroceryTabBar extends ConsumerStatefulWidget {
  const GroceryTabBar({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  final int initialIndex;

  @override
  ConsumerState<GroceryTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<GroceryTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    logger.d('Widget Lifecycle: initState');
    _initializeTabController();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _initializeTabController() {
    int initialIndex = widget.initialIndex;
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: initialIndex);

    _tabController.addListener(_handleTabSelection);
    _handleTabSelection();
  }

  void _handleTabSelection() {
    int selectedIndex = _tabController.index;
    if (selectedIndex == 2) {
      ref
          .read(categoryProvider.notifier)
          .updateCategory(Constants.categoryGrocery);
    } else if (selectedIndex == 3) {
      ref
          .read(categoryProvider.notifier)
          .updateCategory(Constants.categoryShop);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Container(
        //   height: 36.h,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8.r),
        //     color: Colors.transparent, // Set the default background color
        //   ),
        //   child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 24.w),
        //       child: TabBar(
        //         isScrollable: true,
        //         controller: _tabController,
        //         indicator: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8.r),
        //           color: AppColors
        //               .color20A39E, // Set the selected tab background color
        //         ),
        //         labelColor: Colors.white, // Set the selected tab text color
        //         unselectedLabelColor:
        //             Colors.grey, // Set the unselected tab text color
        //         tabs: [
        //           Tab(
        //               child: Text(
        //             'Grocery',
        //             style: TextStyle(fontSize: 16.h),
        //           )),
        //           Tab(
        //               child: Text(
        //             'Convenience',
        //             style: TextStyle(fontSize: 16.h),
        //           )),
        //           Tab(
        //             child: Text('Alcohol', style: TextStyle(fontSize: 16.h)),
        //           )
        //         ],
        //       )),
        // ),
        Expanded(
          child:
              // TabBarView(
              //   controller: _tabController,
              //   children: const [
              GroceryTabContent(),
          // GroceryTabContent(),
          // GroceryTabContent(),
          // ],
          // ),
        ),
      ],
    );
  }
}
