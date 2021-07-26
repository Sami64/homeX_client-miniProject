import 'package:flutter/material.dart';
import 'package:home_x_client/src/home/presentation/widgets/service_list_arguments.dart';
import 'package:home_x_client/src/service_details/presentation/widgets/service_tile.dart';

class ServiceListPage extends StatelessWidget {
  const ServiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceListArguments args =
        ModalRoute.of(context)!.settings.arguments as ServiceListArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.serviceName),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ServiceTile(
                  title: 'Plumbing',
                  description: 'Some Description',
                  onTap: () => Navigator.of(context).pushNamed('/details'));
            }),
      )),
    );
  }
}
