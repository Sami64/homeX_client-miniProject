import 'package:flutter/material.dart';
import 'package:home_x_client/core/service/domain/entities/service.dart';
import 'package:home_x_client/injection_container.dart';
import 'package:home_x_client/src/home/presentation/widgets/service_list_arguments.dart';
import 'package:home_x_client/src/service_details/presentation/bloc/service_details_bloc.dart';
import 'package:home_x_client/src/service_details/presentation/widgets/details_arguments.dart';
import 'package:home_x_client/src/service_details/presentation/widgets/service_tile.dart';

class ServiceListPage extends StatelessWidget {
  ServiceListPage({
    Key? key,
  }) : super(key: key);
  final bloc = sl<ServiceDetailsBloc>();

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
        child: StreamBuilder<List<Service>>(
            stream: bloc.categoryServicesList(pk: args.serviceID),
            builder: (context, snapshot) {
              print('THE CATEGORY ID ${args.serviceID}');
              if (snapshot.hasData && snapshot.data!.length > 0) {
                print(snapshot.data);
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ServiceTile(
                          title: snapshot.data![index].name,
                          description: snapshot.data![index].description,
                          onTap: () => Navigator.of(context).pushNamed(
                              '/details',
                              arguments: DetailsArguments(
                                  pk: snapshot.data![index].key)));
                    });
              } else if (snapshot.hasData && snapshot.data!.length < 1)
                return Center(
                  child: Text('No Services'),
                );
              else
                return Center(
                  child: Text('Loading'),
                );
            }),
      )),
    );
  }
}
