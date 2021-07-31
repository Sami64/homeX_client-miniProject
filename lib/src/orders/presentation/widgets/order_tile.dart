import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderNo;
  final String datePlaced;
  final String serviceName;
  final String sellerName;
  final VoidCallback onTap;
  const OrderTile({Key? key, required this.orderNo,required this.onTap, required this.datePlaced, required this.serviceName, required this.sellerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: Text('Premium Cleaning'),
      trailing: Column(
        children: [Text('Order # '), Text('oredsetawds')],
      ),
      subtitle: Row(
        children: [
          Column(
            children: [Text('Service Personnel')],
          ),
          Column(
            children: [Text('Date Placed')],
          )
        ],
      ),
    );
  }
}
