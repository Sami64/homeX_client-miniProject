import 'package:flutter/material.dart';
import 'package:home_x_client/src/orders/domain/entities/order.dart';
import 'package:home_x_client/src/orders/presentation/bloc/orders_bloc.dart';
import 'package:home_x_client/src/orders/presentation/widgets/order_tile.dart';
import 'package:home_x_client/src/service_ongoing/presentation/widgets/service_ongonig_arguments.dart';

import '../../../../injection_container.dart';

class UnderWayPage extends StatelessWidget {
  UnderWayPage({Key? key}) : super(key: key);

  final bloc = sl<OrdersBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Orders>>(
          stream: bloc.userOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.length > 0)
              return Container(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderTile(
                          onTap: () => Navigator.of(context).pushNamed(
                              '/serviceOngoing',
                              arguments: ServiceOngoingArguments(
                                  orderNo: snapshot.data![index].orderNo,
                                  sellerName: snapshot.data![index].seller.name,
                                  serviceName:
                                      snapshot.data![index].serviceName,
                                  datePlaced:
                                      snapshot.data![index].datePlaced)),
                          sellerName: snapshot.data![index].seller.name,
                          serviceName: snapshot.data![index].serviceName,
                          orderNo: snapshot.data![index].orderNo,
                          datePlaced: snapshot.data![index].datePlaced,
                        );
                      }));
            else if (snapshot.hasData && snapshot.data!.length < 1)
              return Center(
                child: Text('No Orders'),
              );
            else
              return Center(
                child: Text('Loading'),
              );
          }),
    );
  }
}
