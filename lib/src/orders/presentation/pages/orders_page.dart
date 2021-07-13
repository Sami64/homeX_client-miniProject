import 'package:flutter/material.dart';
import 'package:home_x_client/src/orders/presentation/widgets/order_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: SafeArea(
        child: Container(child:
            ListView.builder(itemBuilder: (BuildContext context, int index) {
          return OrderTile();
        })),
      ),
    );
  }
}
