import 'package:flutter/material.dart';
import 'package:home_x_client/core/presentation/pages/loading.dart';
import 'package:home_x_client/src/service_ongoing/presentation/bloc/service_ongoing_bloc.dart';
import 'package:home_x_client/src/service_ongoing/presentation/widgets/service_ongonig_arguments.dart';

import '../../../../injection_container.dart';

class ServiceOngoingPage extends StatefulWidget {
  const ServiceOngoingPage({Key? key}) : super(key: key);

  @override
  _ServiceOngoingPageState createState() => _ServiceOngoingPageState();
}

class _ServiceOngoingPageState extends State<ServiceOngoingPage> {
  final bloc = sl<ServiceOngoingBloc>();
  @override
  Widget build(BuildContext context) {
    ServiceOngoingArguments args =
        ModalRoute.of(context)!.settings.arguments as ServiceOngoingArguments;
    return Scaffold(
        body: Column(
      children: [
        Text('OrderNo'),
        Text('Lottie Anim'),
        Text('DatePlaced'),
        Text('Service Name'),
        ElevatedButton(onPressed: () {}, child: Text('Verify Personnel')),
        ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LoadingPage(
                    errorText: bloc.completeUserService(args.orderNo),
                    callback: () => Navigator.of(context).pushNamed('/main'),
                  );
                }),
            child: Text('Personnel Complete'))
      ],
    ));
  }
}
