import 'package:flutter/material.dart';
import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/presentation/bloc/orders_bloc.dart';
import 'package:home_x_client/src/orders/presentation/pages/completed_page.dart';
import 'package:home_x_client/src/orders/presentation/pages/under_way_page.dart';
import 'package:home_x_client/src/orders/presentation/widgets/order_tile.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({Key? key}) : super(key: key);

  final bloc = sl<OrdersBloc>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Orders'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            bottom: TabBar(
              unselectedLabelColor: Colors.blueAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueAccent),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.blueAccent, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Under Way"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.blueAccent, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Completed"),
                    ),
                  ),
                ),
                // Tab(
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50),
                //         border: Border.all(color: Colors.blueAccent, width: 1)),
                //     child: Align(
                //       alignment: Alignment.center,
                //       child: Text("Cancelled"),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          body: TabBarView(
            children: [UnderWayPage(), CompletedPage()],
          ),
        ));
  }
}
