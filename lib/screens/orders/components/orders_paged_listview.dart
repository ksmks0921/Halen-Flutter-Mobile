import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/orders_state.dart';
import 'package:halen_customer_app/screens/orders/components/nothing_here.dart';
import 'package:halen_customer_app/screens/orders/components/order_in_progress_lvi.dart';
import 'package:halen_customer_app/screens/orders/components/order_history_lvi.dart';
import 'package:halen_customer_app/screens/orders/models/order_models.dart';
import 'package:halen_customer_app/screens/orders/requests/get_order_data.dart';
import 'package:halen_customer_app/configuration/debug_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderPagedLV extends ConsumerStatefulWidget {
  const OrderPagedLV(
      {Key? key,
      required this.orderStatus,
      this.serviceFilterVal,
      this.statusFilterVal,
      this.rateTapCB})
      : super(key: key);

  final OrderStatus orderStatus;
  final Function? rateTapCB;
  final String? serviceFilterVal;
  final String? statusFilterVal;

  @override
  OrderPagedLVState createState() => OrderPagedLVState();
}

class OrderPagedLVState extends ConsumerState<OrderPagedLV> {
  //TODO bump this up significantly.. > 100 or  > 1000 depending on backend. just for testing
  final _numberOfPostsPerRequest = 5;

  final PagingController<int, dynamic> _pagingController =
      PagingController(firstPageKey: 0);

  late List ordersCache;
  late dynamic ordersNotifier;
  @override
  void initState() {
    if (widget.orderStatus == OrderStatus.inProgress) {
      ordersCache = ref.read(ordersProgProv);
      ordersNotifier = ref.read(ordersProgProv.notifier);
    }
    if (widget.orderStatus == OrderStatus.complete) {
      ordersCache = ref.read(ordersHistProv);
      ordersNotifier = ref.read(ordersHistProv.notifier);
    }

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  // can be called if orders are added by user
  Future<void> _refreshPage() async {
    logger.d("[OrdersPagedListview] Refresh orders page called");
    ordersNotifier.setOrder([]);
    _pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    // avoid widget rebuilds
    Future.delayed(Duration.zero, () {
      logger
          .d("[OrdersPagedListview] Fetch page pagekey ${pageKey.toString()}");

      bool getNewOrderData = false;

      // widget has not been rebuilt so don't need cache (primary purpose)
      if (_pagingController.itemList != null) {
        getNewOrderData = true;
      }
      // initial condition, cache is empty
      else if (_pagingController.itemList == null && ordersCache.isEmpty) {
        getNewOrderData = true;
      }

      if (getNewOrderData) {
        logger.d("[OrdersPagedListview]  get new order data called");
        Future.delayed(const Duration(milliseconds: 200), () async {
          try {
            final response = await getOrderData(
                pageKey, _numberOfPostsPerRequest, widget.orderStatus);

            ordersNotifier.addOrder(response);

            final isLastPage = response.length < _numberOfPostsPerRequest;

            if (isLastPage) {
              _pagingController.appendLastPage(response.toList());
            } else {
              final nextPageKey = pageKey + 1;
              _pagingController.appendPage(response.toList(), nextPageKey);
            }
          } catch (e) {
            logger.d("[OrdersPagedListview]  fetch order page error --> $e");
            _pagingController.error = e;
          }
        });
      } else if (ordersCache.isNotEmpty) {
        // using appendLastPage does not work correctly
        // _pagingController.appendLastPage(ordersCache);
        var chunks = [];
        int chunkSize = 5;
        for (var i = 0; i < ordersCache.length; i += chunkSize) {
          chunks.add(ordersCache.sublist(
              i,
              i + chunkSize > ordersCache.length
                  ? ordersCache.length
                  : i + chunkSize));
        }
        int pageBuildIdx = 0;
        for (var chunk in chunks) {
          _pagingController.appendPage(chunk, pageBuildIdx + 1);
          pageBuildIdx += 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => _refreshPage(),
        child: PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate(
                newPageProgressIndicatorBuilder: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            }, itemBuilder: (BuildContext context, dynamic item, int index) {
              Widget retItem = widget.orderStatus == OrderStatus.complete
                  ? OrderHistoryLVI(
                      orderData: item,
                      rateTapCB: widget.rateTapCB!,
                    )
                  : OrderInProgressLVI(orderData: item);

              bool shouldRet = false;

              // no filters
              if ((widget.serviceFilterVal == null ||
                      widget.serviceFilterVal == "All") &&
                  (widget.statusFilterVal == null ||
                      widget.statusFilterVal == "All")) {
                shouldRet = true;
              }

              // filter service type is item service type
              if (widget.serviceFilterVal != "All" &&
                  widget.serviceFilterVal != null) {
                if (item["service_type"] == widget.serviceFilterVal &&
                    (widget.statusFilterVal == "All" ||
                        widget.statusFilterVal == null ||
                        widget.statusFilterVal!.toLowerCase() ==
                            item["order_status_type"].toLowerCase())) {
                  shouldRet = true;
                }
              }

              // filter status type is item status type
              if (widget.statusFilterVal != "All" &&
                  widget.statusFilterVal != null) {
                if (item["order_status_value"] == widget.statusFilterVal &&
                    (widget.serviceFilterVal == "All" ||
                        widget.serviceFilterVal == null ||
                        widget.serviceFilterVal!.toLowerCase() ==
                            item["service_type"].toLowerCase())) {
                  shouldRet = true;
                }
              }
              if (shouldRet) {
                return retItem;
              }
              return Container();
            }, noMoreItemsIndicatorBuilder: (BuildContext context) {
              return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(
                    child: Text("No more items",
                        style: TextStyle(color: Colors.black)),
                  ));
            }, noItemsFoundIndicatorBuilder: (BuildContext context) {
              return const OrdersNothingHere();
            }, firstPageErrorIndicatorBuilder: (BuildContext context) {
              return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(
                    child: Text("Something went wrong ",
                        style: TextStyle(color: Colors.black)),
                  ));
            }, newPageErrorIndicatorBuilder: (BuildContext context) {
              return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(
                    child: Text("Something went wrong",
                        style: TextStyle(color: Colors.black)),
                  ));
            })));
  }
}
